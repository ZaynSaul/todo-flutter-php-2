<?php
require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();

$user_id = intval($_POST['user_id']);
$todo_id = intval($_POST['todo_id']);

$sql = "SELECT * FROM todo_item WHERE user_id = $user_id AND todo_id = $todo_id AND is_done = 1";
$query = mysqli_query($obj->connection(), $sql);

if (!$query) {
    echo json_encode(["status" => "error", "message" => "Failed to execute query: " . $obj->connection()->error]);
    $obj->connection()->close();
    exit();
}

$count = mysqli_num_rows($query);

if ($count > 0) {
    $sql = "DELETE FROM todo_item WHERE user_id = $user_id AND todo_id = $todo_id AND is_done = 1";

    if ($obj->connection()->query($sql) === TRUE) {
        echo json_encode(["status" => "success", "message" => "Completed todo items deleted successfully"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to delete completed todo items: " . $obj->connection()->error]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "No completed todo items found"]);
}

$obj->connection()->close();
