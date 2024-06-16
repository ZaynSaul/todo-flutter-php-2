<?php
require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();

$name = $_POST['name'];
$email = strtolower($_POST['email']);
$password = strtolower($_POST['password']);

// Check if email is already taken
$sql = "SELECT * FROM users WHERE email = '" . $email . "'";
$query = mysqli_query($obj->connection(), $sql);

if (mysqli_num_rows($query) > 0) {
    echo json_encode(["status" => "error", "message" => "Email already taken"]);
} else {
    $password_hash = password_hash($password, PASSWORD_DEFAULT);
    $full_name = ucwords($name);

    $insert = "INSERT INTO users(name, email, password) VALUES ('" . $full_name . "', '" . $email . "', '" . $password_hash . "')";
    $result = mysqli_query($obj->connection(), $insert);

    if ($result) {
        // Fetch the newly created user data
        $sql = "SELECT * FROM users WHERE email = '" . $email . "'";
        $query = mysqli_query($obj->connection(), $sql);
        $data = mysqli_fetch_array($query);

        echo json_encode(["status" => "success", "data" => $data]);
    } else {
        echo json_encode(["status" => "error", "message" => "Registration failed"]);
    }
}

$obj->connection()->close();
