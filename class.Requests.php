<?php
class Requests{
 
    private $conn;
    private $table_name = "`requests`";

    public $event;
    public $country;

    public function __construct($db){
        $this->conn = $db;
    }
    public function readAll(){
        $query = "SELECT `event`,`country`,SUM(`counter`) as counter FROM
                    " . $this->table_name . " JOIN
                        (SELECT DISTINCT `country` as countr FROM " . $this->table_name . "
                            GROUP BY `country`
                            ORDER BY SUM(`counter`) DESC
                            LIMIT 2) sub  on " . $this->table_name . ".`country` in (sub.countr)
                    WHERE `date` >= DATE(NOW()) - INTERVAL 7 DAY
                    GROUP BY `event`,`country`
                    ";
        $res = $this->conn->prepare($query);
     
        $res->execute();
        $res = $res->fetchAll(PDO::FETCH_ASSOC);
        return $res;
    }
    public function increateCounter() {
        $query = "  INSERT INTO " . $this->table_name." (`event`, `country`, `date`)
                    SELECT * FROM (SELECT '".strtoupper($this->event)."','".strtolower($this->country)."', CURDATE()) as tmp 
                    WHERE NOT EXISTS ( SELECT * FROM "  . $this->table_name. " 
                        WHERE `event` = '".$this->event."'
                        AND `country` = '".$this->country."'
                        AND DATE(`date`) = CURDATE());
                    UPDATE ". $this->table_name." 
                    SET `counter` = (`counter` + 1) 
                    WHERE `event` = '".$this->event."'
                        AND `country` = '".$this->country."'
                        AND DATE(`date`) = CURDATE();";
        $res = $this->conn->prepare($query);
     
        $res->execute();
        return $res;
    }
}