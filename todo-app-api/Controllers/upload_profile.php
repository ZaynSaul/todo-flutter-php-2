<?php
require_once '../Config/server.php';
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$obj = new Server();

$profileName = $_POST['profile'];
$profileData = $_POST['profileData'];
$id = intval($_POST['user_id']);

// Fetch old profile image path
$oldProfileImageResult = $obj->connection()->query("SELECT profile FROM users WHERE id = '$id'");


// Save new profile image
$path = "../uploads/$profileName";
if (file_put_contents($path, base64_decode($profileData))) {
    // Update profile name in the database
    $updateResult = $obj->connection()->query("UPDATE users SET profile='$profileName' WHERE id = '$id' ");

    if ($updateResult) {
        if ($oldProfileImageResult && $oldProfileImageResult->num_rows == 1) {
            $row = $oldProfileImageResult->fetch_assoc();
            $oldProfileImage = $row['profile'];

            // Delete old profile image if it exists
            if (!empty($oldProfileImage) && file_exists("../uploads/$oldProfileImage")) {
                unlink("../uploads/$oldProfileImage");
            }
        }
        echo json_encode(["status" => "success", "message" => "Profile updated successfully"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to update profile"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Failed to save profile image"]);
}

$obj->connection()->close();
