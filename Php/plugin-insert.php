<?php
    require_once("DataBase.php");
    require_once("ApiRequest.php");
    require_once("ApiResponse.php");
    if(isset($_POST["id_owner"]) && isset($_POST["id_cause"])){
        $db = new DataBase("mysql57","root","3KfIhp3UDC","api");/* Modificar estos datos */
        $apiRequest = new ApiRequest($_POST["id_owner"],$_POST["ticket_id"],$_POST["ticket_number"],$_POST["id_queues"],$_POST["comments"],$_POST["id_cause"]);
        $query = "INSERT INTO incidents (ID_OWNER,ID_QUEUE,ID_CAUSE,DATE,TICKET_NUM,TICKET_ID,COMMENTS) VALUES (". $apiRequest->getIdOwner() .",". $apiRequest->getIdQueues() ."," . $apiRequest->getIdCause() .", NOW(),". $apiRequest->getTicketNumber() .",". $apiRequest->getTicketId() .",'". $apiRequest->getComments() ."')";
        $db->insertUpdateDelete($query);
        echo "Inserted record.";
    }else{
        echo "Failed insert.";
    }
?>
