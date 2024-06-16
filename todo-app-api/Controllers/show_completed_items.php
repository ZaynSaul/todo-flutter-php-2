<?php
require_once '../Config/server.php';
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();
$list = array();

$todo_id = intval($_POST['todo_id']);

// Validate input
if ($todo_id <= 0) {
    echo json_encode(["status" => "error", "message" => "Invalid todo_id"]);
    exit();
}

// Execute the query
$result = $obj->connection()->query("SELECT * FROM todo_item WHERE todo_id = '$todo_id' AND is_done = 1 ORDER BY id DESC");

if ($result) {
    while ($row = $result->fetch_assoc()) {
        $list[] = $row;
    }
    echo json_encode(["status" => "success", "data" => $list]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to fetch completed todo items"]);
}

// Close the connection
$obj->connection()->close();
