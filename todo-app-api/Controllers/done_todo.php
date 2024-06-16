<?php
require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();

$isDone = intval($_POST['is_done']);
$id = intval($_POST['id']);

// Check if the ID and is_done are valid
if ($id > 0) {
    $updateSql = "UPDATE todo SET is_done = $isDone WHERE id = $id";

    if ($obj->connection()->query($updateSql) === TRUE) {
        echo json_encode(["status" => "success", "message" => "Todo status updated successfully"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to update todo status: " . $obj->connection()->error]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid input"]);
}

$obj->connection()->close();