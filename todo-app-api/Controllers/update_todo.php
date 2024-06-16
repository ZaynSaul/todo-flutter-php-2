<?php
require_once '../Config/server.php';
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();

$title = ucfirst(trim($_POST['title']));
$id = intval($_POST['id']);

$todo_id = (int)$id;

$sql = "UPDATE todo SET title='" . $title . "' WHERE id = '" . $todo_id . "' ";
if ($obj->connection()->query($sql) == TRUE) {
    echo json_encode(["status" => "success", "message" => "Todo list updated successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to update todo list: " . $obj->connection()->error]);
}

$obj->connection()->close();
