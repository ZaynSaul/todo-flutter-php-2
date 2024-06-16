<?php

require_once '../Config/server.php';
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();
$list = array();

$user_id = intval($_POST['user_id']);


$result = $obj->connection()->query("SELECT * FROM todo WHERE user_id = '" . $user_id . "'  ORDER BY id DESC");

$todos = array();

if ($result->num_rows > 0) {
    // Fetch each todo
    while ($row = $result->fetch_assoc()) {
        $todo = $row;
        $todo['items'] = array();

        // Fetch associated todo items
        $itemSql = "SELECT * FROM todo_item WHERE todo_id = " . $row['id'] . "  ORDER BY id DESC";
        $itemResult = $obj->connection()->query($itemSql);
        if ($itemResult->num_rows > 0) {
            while ($itemRow = $itemResult->fetch_assoc()) {
                $todo['items'][] = $itemRow;
            }
        }
        $todos[] = $todo;
    }
    echo json_encode(["status" => "success", "data" => $todos]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to retrieve todo lists: " . $obj->connection()->error]);
}

// Close connection
$obj->connection()->close();

// Output nested todos