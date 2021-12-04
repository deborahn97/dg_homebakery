<?php

    if(!isset($_POST)) {
        $response = array('status' => 'failed');
        echo "failed";
        die();
    }

    include_once("db_connect.php");

    $email = $_POST['email'];
    $pass = sha1($_POST['pass']);

    $sql = "SELECT * FROM user WHERE user_email = '$email' AND user_pass = '$pass'";
    $result = $conn -> query($sql);

    if($result -> num_rows > 0) {
        while($row = $result -> fetch_assoc()) {
            $user = array();
            $user['id'] = $row['user_id'];
            $user['name'] = $row['user_name'];
            $user['email'] = $row['user_email'];
            $user['phone'] = $row['user_phone'];
            $user['address'] = $row['user_address'];

            echo json_encode($user);
            return;
        }
    } else
        echo "failed";

    mysqli_close($conn);

?>