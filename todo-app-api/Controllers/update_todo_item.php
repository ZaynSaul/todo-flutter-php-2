<?php
require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");


$obj = new Server();

$id = intval($_POST['id']);
$title = ucfirst(trim($_POST['title']));
$description = ucfirst(trim($_POST['description']));

$sql = "UPDATE todo_item SET title='" . $title . "', description= '" . $description . "' WHERE id = '" . $id . "' ";
if ($obj->connection()->query($sql) == TRUE) {
    echo json_encode(["status" => "success", "message" => "Todo item updated successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to update todo item: " . $obj->connection()->error]);
}


$obj->connection()->close();