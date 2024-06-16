<?php
require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");

try {
    $obj = new Server();

    $deleteId = intval($_POST['id']);

    $obj->connection()->query("DELETE FROM todo  WHERE id = '" . $deleteId . "' ");


    foreach ($_POST['id'] as $deleteItemId) {
        $obj->connection()->query("DELETE FROM todo_item  WHERE todo_id = '" . $deleteItemId . "' ");
    }
} catch (Exception $e) {
    echo json_encode("FAILED");
}

$obj->connection()->close();