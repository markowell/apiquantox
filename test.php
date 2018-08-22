<?php
header("Access-Control-Allow-Origin: *");

include_once 'class.Database.php';
include_once 'class.Requests.php';
 
$database = new Database();
$db = $database->createConnection();

$response = new stdClass(array(
    "code" => 500,
    "message" => "Bad request",
    "body" => array(),
));

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data = file_get_contents('php://input');
    $json_data = json_decode($data);
    if (isset($json_data->country) && isset($json_data->event)) {
        $request = new Requests($db);
        $request->country = $json_data->country;
        $request->event = $json_data->event;
        $request->increateCounter();
        $response->code = 200;
        $response->message = "Success";
    }
} else if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $request = new Requests($db);
    $result = $request->readAll();
    $response->body = $result;
    $response->code = 200;
    $response->message = "Success";
} 
if (isset($response->body) && ('200' == $response->code) && ($_SERVER['REQUEST_METHOD'] == 'GET')) {
    if (isset($_GET['type']) && $_GET['type'] == 'xml') {
        $xml = new SimpleXMLElement('<data/>');
        foreach ($response->body as $key => $array) {
            $array = array_flip($array);
            array_walk_recursive($array, array ($xml, 'addChild'));
        }
        header('Content-Type: text/xml');
        echo $xml->asXML();
    } else if (isset($_GET['type']) && $_GET['type'] == 'csv') {
        $file = fopen("quantox.csv","w");
        foreach ($response->body as $line) {
            fputcsv($file,$line);
        }
        fclose($file); 
        header('Content-Type: application/csv');
        header('Content-Disposition: attachment; filename="quantox.csv";');

    } else {
        header("Content-Type: application/json; charset=UTF-8");
        echo json_encode($response->body);
    }
}
?>