<?php
require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();

$id = intval($_POST['id']);

// Check if there are items for the given todo_id
$sqlCheckItems = "SELECT * FROM todo_item WHERE todo_id = $id";
$query = mysqli_query($obj->connection(), $sqlCheckItems);

if ($query) {
    $count = mysqli_num_rows($query);

    // Delete items if they exist
    if ($count > 0) {
        $sqlDeleteItems = "DELETE FROM todo_item WHERE todo_id = $id";
        if (!$obj->connection()->query($sqlDeleteItems)) {
            echo json_encode(["status" => "error", "message" => "Failed to delete todo items: " . $obj->connection()->error]);
            $obj->connection()->close();
            exit();
        }
    }

    // Delete the todo list itself
    $sqlDeleteTodo = "DELETE FROM todo WHERE id = $id";
    if ($obj->connection()->query($sqlDeleteTodo) === TRUE) {
        echo json_encode(["status" => "success", "message" => "Todo list and its items deleted successfully"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to delete todo list: " . $obj->connection()->error]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Failed to execute query: " . $obj->connection()->error]);
}

$obj->connection()->close();
