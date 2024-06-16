<?php
require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");


$obj = new Server();
$title = ucfirst(trim($_POST['title']));
$user_id = intval($_POST['user_id']);

$sql = "INSERT INTO todo(title, user_id) VALUES ('" . $title . "', '" . $user_id . "') ";

if ($obj->connection()->query($sql) == TRUE) {

    echo json_encode(["status" => "success", "message" => "Todo list created successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to create todo list: " . $obj->connection()->error]);
}


$obj->connection()->close();
