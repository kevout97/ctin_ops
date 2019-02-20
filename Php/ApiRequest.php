<?php
class ApiRequest{
    private $idOwner;
    private $ticketId;
    private $ticketNumber;
    private $idQueues;
    private $comments;
    private $idCause;
    function __construct($idOwner,$ticketId,$ticketNumber,$idQueues,$comments,$idCause){
        $this->idOwner = $idOwner;
        $this->ticketId = $ticketId;
        $this->ticketNumber = $ticketNumber;
        $this->comments = $comments;
        $this->idCause = $idCause;
    }

    function getIdOwner(){
        return $this->idOwner;
    }

    function getTicketId(){
        return $this->ticketId;
    }

    function getTicketNumber(){
        return $this->ticketNumber;
    }

    function getIdQueues(){
        return $this->idQueues;
    }

    function getComments(){
        return $this->comments;
    }

    function getIdCause(){
        return $this->idCause;
    }
}
?>