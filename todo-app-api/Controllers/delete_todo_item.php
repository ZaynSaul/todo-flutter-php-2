<?php
require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();
$id = intval($_POST['id']);

$sql = "DELETE FROM todo_item WHERE id = $id";

if ($obj->connection()->query($sql) === TRUE) {
    echo json_encode(["status" => "success", "message" => "Todo item deleted successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to delete todo item: " . $obj->connection()->error]);
}

$obj->connection()->close();