<?php
    require_once("DataBase.php");
    require_once("ApiResponse.php");
    header('Content-Type: application/json');
    $db = new DataBase("mysql57","root","3KfIhp3UDC","api");/* Modificar estos datos */
    $apiResponse = new ApiResponse();
    $query = "SELECT * FROM queues";
    $apiResponse->setQueues($db->select($query));
    $query = "SELECT * FROM causes";
    $apiResponse->setCauses($db->select($query));
    $query = "SELECT * FROM owner";
    $apiResponse->setOwners($db->select($query));
    echo json_encode($apiResponse);
?>
