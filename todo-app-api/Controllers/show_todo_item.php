<?php

require_once '../Config/server.php';
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();
$list = array();

$todo_id = intval($_POST['todo_id']);

$sql = "SELECT * FROM todo_item WHERE todo_id = $todo_id ORDER BY id DESC";
$result = $obj->connection()->query($sql);

if ($result) {
    while ($row = $result->fetch_assoc()) {
        $list[] = $row;
    }
    echo json_encode(["status" => "success", "data" => $list]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to retrieve todo items: " . $obj->connection()->error]);
}

$obj->connection()->close();