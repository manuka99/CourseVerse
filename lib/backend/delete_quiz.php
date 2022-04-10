<?php
include 'db_conn.php';
header("Access-Control-Allow-Origin: *");

//delete quiz
$id = $_POST["id"];
$conn->query('DELETE FROM quiz WHERE id=' . $id);
