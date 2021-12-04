<?php

    if(!isset($_POST)) {
        $response = array('status' => 'failed');
        sendJsonResponse($response);
        die();
    }

    include_once("db_connect.php");

    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $pass = sha1($_POST['pass']);
    $na = "NA";

    $sql = 
    "INSERT INTO user (user_name, user_email, user_phone, user_pass, user_address) 
     VALUES ('$name', '$email', '$phone', '$pass', '$na')";
    
    if($conn -> query($sql) === TRUE) {
        $response = array('status' => 'success');
        sendJsonResponse($response);
    } else {
        $response = array('status' => 'failed');
        sendJsonResponse($response);
    }

    function sendJsonResponse($sentArr) {
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode($sentArr);
    }

    mysqli_close($conn);

?>