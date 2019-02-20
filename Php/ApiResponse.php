<?php
class ApiResponse{
    $owners;
    $causes;
    $queues;

    function setOwners($owners){
        $this->owners = $owners;
    }

    function setCauses($causes){
        $this->causes = $causes;
    }

    function setQueues($queues){
        $this->queues = $queues;
    }
}
?>