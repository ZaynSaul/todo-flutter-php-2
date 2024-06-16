<?php

require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();

$todo_id = intval($_POST['todo_id']);
$list = array();

$sql = "SELECT COUNT(*) as count FROM todo_item WHERE todo_id = $todo_id AND is_done = 1";
$result = $obj->connection()->query($sql);

if ($result) {
    $row = $result->fetch_assoc();
    $count = $row['count'];
    echo json_encode(["status" => "success", "count" => $count]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to retrieve todo items count: " . $obj->connection()->error]);
}

$obj->connection()->close();
