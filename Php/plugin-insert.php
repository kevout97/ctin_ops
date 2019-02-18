<?php
    require_once("DataBase.php");
    if(isset($_POST["ticket_id"]) && isset($_POST["id_owner"]) && isset($_POST["id_cause"])){
        $db = new DataBase("localhost","root","pass","database");
        $id_owner = filter_var($_POST["ticket_owner"],FILTER_SANITIZE_NUMBER_INT);
        $ticket_id = filter_var($_POST["ticket_id"],FILTER_SANITIZE_NUMBER_INT);
        $ticket_number = filter_var($_POST["ticket_number"],FILTER_SANITIZE_NUMBER_INT);
        $id_queues = filter_var($_POST["id_queue"],FILTER_SANITIZE_NUMBER_INT);
        $comments = filter_var($_POST["comments"],FILTER_SANITIZE_STRING);
        $id_cause = filter_var($_POST["id_cause"],FILTER_SANITIZE_NUMBER_INT);
        $query = "INSERT INTO incidents (ID_OWNER,ID_QUEUE,ID_CAUSE,DATE,TICKET_NUM,TICKET_ID,COMMENTS) VALUES (". $id_owner .",". $id_queues ."," . $id_cause .", now(),". $ticket_number .",". $ticket_id .",'". $comments ."')";
        $db->insertUpdateDelete($query);
        
    }else{
        echo "Failed insert.";
    }
?>