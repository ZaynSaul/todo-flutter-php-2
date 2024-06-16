<?php
require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();

if (isset($_POST['id']) && is_array($_POST['id'])) {
    $ids = array_map('intval', $_POST['id']);

    $allItemsDeleted = true;
    $allListsDeleted = true;
    $errorMessage = "";

    foreach ($ids as $id) {
        // Delete items associated with the list
        $deleteItemsSql = "DELETE FROM todo_item WHERE todo_id = $id";
        if (!$obj->connection()->query($deleteItemsSql)) {
            $allItemsDeleted = false;
            $errorMessage .= "Failed to delete items for list ID $id: " . $obj->connection()->error . ". ";
        }

        // Delete the list itself
        $deleteListSql = "DELETE FROM todo WHERE id = $id";
        if (!$obj->connection()->query($deleteListSql)) {
            $allListsDeleted = false;
            $errorMessage .= "Failed to delete list ID $id: " . $obj->connection()->error . ". ";
        }
    }

    if ($allItemsDeleted && $allListsDeleted) {
        echo json_encode(["status" => "success", "message" => "Todo lists and their items deleted successfully"]);
    } else {
        echo json_encode(["status" => "error", "message" => trim($errorMessage)]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid input"]);
}

$obj->connection()->close();
