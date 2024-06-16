<?php

require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();

$email = strtolower($_POST['email']);
$password = strtolower($_POST['password']);

// Check if email exists
$sql = "SELECT * FROM users WHERE email = '" . $email . "'";
$query = mysqli_query($obj->connection(), $sql);
$data = mysqli_fetch_array($query);

if ($data) {
    // Check if password is correct
    if (password_verify($password, $data['password'])) {
        $userData = $data;
        echo json_encode(["status" => "success", "data" => $userData]);
    } else {
        echo json_encode(["status" => "error", "message" => "Incorrect password"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Email not found"]);
}

$obj->connection()->close();

