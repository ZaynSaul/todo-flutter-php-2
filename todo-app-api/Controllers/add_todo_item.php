<?php

require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();
$title = ucfirst(trim($_POST['title']));
$description = trim($_POST['description']);
$todo_id = intval($_POST['todo_id']);
$user_id = intval($_POST['user_id']);

$sql = "INSERT INTO todo_item(title, description, todo_id, user_id) VALUES ('$title', '$description', $todo_id, $user_id)";

if ($obj->connection()->query($sql) === TRUE) {
    echo json_encode(["status" => "success", "message" => "Todo item created successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to create todo item: " . $obj->connection()->error]);
}

$obj->connection()->close();
