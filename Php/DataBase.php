<?php
class DataBase{
    private $connection;
    private $statement;

    function __construct($host,$user,$password,$database){
        try{
            $this->connection = new PDO('mysql:host=' . $host .';dbname=' . $database, $user, $password);
        }catch (PDOException $e) {
            echo "¡Error!: " . $e->getMessage() . "<br/>";
            die();
        }
    }

    function select($query){
        try{
            $this->statement = ($this->connection)->prepare($query);
            $this->statement->execute();
            return $this->statement;
        }catch (PDOException $e){
            echo "¡Error!: " . $e->getMessage() . "<br/>";
            die();
        }
    }

    function insertUpdateDelete($query){
        try{
           $this->statement = $this->connection->prepare($query);
           $this->statement->execute();
        }catch (PDOException $e){
            echo "¡Error!: " . $e->getMessage() . "<br/>";
            die();
        }
    }

    function closeConnection(){
        $this->connection = null;
        $this->statement = null;
    }

}
?>