<?php
require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();

$isDone = intval($_POST['is_done']);
$id = intval($_POST['id']);

$sql = "UPDATE todo_item SET is_done='$isDone' WHERE id = '$id'";

if ($obj->connection()->query($sql) === TRUE) {
    echo json_encode(["status" => "success", "message" => "Todo item updated successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to update todo item: " . $obj->connection()->error]);
}

$obj->connection()->close();