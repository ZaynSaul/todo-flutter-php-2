<?php
require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();

$user_id = intval($_POST['id']);

// Fetch user data from database
$result = $obj->connection()->query("SELECT * FROM users WHERE id = '$user_id'");
if ($result && $result->num_rows > 0) {
    $data = $result->fetch_assoc(); // Fetch associative array of data
    echo json_encode(["status" => "success", "data" => $data]); // Encode data as JSON and return
} else {
    echo json_encode(["status" => "error", "message" => "User data not found"]);
}

$obj->connection()->close();
