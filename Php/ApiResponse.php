<?php
class ApiResponse{
    public $owners = array ();
    public $causes = array ();
    public $queues = array ();

    function setOwners($owners){
        while ($owner = $owners->fetch(PDO::FETCH_ASSOC)) {
            array_push($this->owners,$owner);
        }  
    }

    function setCauses($causes){
        while ($cause = $causes->fetch(PDO::FETCH_ASSOC)) {
            array_push($this->causes,$cause);
        }
    }

    function setQueues($queues){
        while ($queue = $queues->fetch(PDO::FETCH_ASSOC)) {
            array_push($this->queues,$queue);
        }
    }
}
?>