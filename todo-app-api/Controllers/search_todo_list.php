<?php
require_once '../Config/server.php';
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();
$list = array();

$query = $_POST['title'];
$user_id = intval($_POST['user_id']);

// Validate input
if (empty($query) || $user_id <= 0) {
    echo json_encode(["status" => "error", "message" => "Invalid input"]);
    exit();
}

// Execute the query
$sql = "SELECT * FROM todo WHERE title LIKE '%$query%' AND user_id = $user_id";
$result = $obj->connection()->query($sql);

if ($result) {
    while ($row = $result->fetch_assoc()) {
        $list[] = $row;
    }
    echo json_encode(["status" => "success", "data" => $list]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to execute query: " . $obj->connection()->error]);
}

// Close the connection
$obj->connection()->close();
