<?php
require_once '../Config/server.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();

$email = strtolower(trim($_POST['email']));
$password = strtolower(trim($_POST['password']));
$new_password = strtolower(trim($_POST['new_password']));

$sql = "SELECT * FROM users WHERE email = '$email'";
$query = mysqli_query($obj->connection(), $sql);

if (mysqli_num_rows($query) == 1) {
    $data = mysqli_fetch_array($query);

    if (password_verify($password, $data['password'])) {
        if ($password === $new_password) {
            echo json_encode(["status" => "error", "message" => "New password cannot be the same as the old password"]);
        } else {
            $password_hash = password_hash($new_password, PASSWORD_DEFAULT);
            $update = "UPDATE users SET password='$password_hash' WHERE email='$email'";
            $result = mysqli_query($obj->connection(), $update);

            if ($result) {
                echo json_encode(["status" => "success", "message" => "Password updated successfully"]);
            } else {
                echo json_encode(["status" => "error", "message" => "Failed to update password: " . $obj->connection()->error]);
            }
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Current password is incorrect"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Email not found"]);
}

$obj->connection()->close();
