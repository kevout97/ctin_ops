<?php
    require_once("DataBase.php");
    require_once("ApiRequest.php");
    require_once("ApiResponse.php");
    if(isset($_POST["id_owner"]) && isset($_POST["id_cause"])){
        $db = new DataBase("mysql57","root","3KfIhp3UDC","api");/* Modificar estos datos */
        $apiRequest = new ApiRequest(filter_var($_POST["id_owner"],FILTER_SANITIZE_NUMBER_INT),filter_var($_POST["ticket_id"],FILTER_SANITIZE_NUMBER_INT),filter_var($_POST["ticket_number"],FILTER_SANITIZE_NUMBER_INT),filter_var($_POST["id_queues"],FILTER_SANITIZE_NUMBER_INT),filter_var($_POST["comments"],FILTER_SANITIZE_STRING),filter_var($_POST["id_cause"],FILTER_SANITIZE_NUMBER_INT));
        $query = "INSERT INTO incidents (ID_OWNER,ID_QUEUE,ID_CAUSE,DATE,TICKET_NUM,TICKET_ID,COMMENTS) VALUES (". $apiRequest->getIdOwner() .",". $apiRequest->getIdQueues() ."," . $apiRequest->getIdCause() .", now(),". $apiRequest->getTicketNumber() .",". $apiRequest->getTicketId() .",'". $apiRequest->getComments() ."')";
        $db->insertUpdateDelete($query);
        $apiResponse = new ApiResponse();
        $query = "SELECT * FROM queues";
        $apiResponse->setQueues($db->select($query));
        $query = "SELECT * FROM causes";
        $apiResponse->setCauses($db->select($query));
        $query = "SELECT * FROM owner";
        $apiResponse->setOwners($db->select($query));
        echo json_encode($apiResponse);
    }else{
        echo "Failed insert.";
    }
?>
