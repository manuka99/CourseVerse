<?php
include 'db_conn.php';
header("Access-Control-Allow-Origin: *");

$id = $_POST['id'];
$question = $_POST['question'];
$option1 = $_POST['option1'];
$option2 = $_POST['option2'];
$option3 = $_POST['option3'];
$option4 = $_POST['option4'];

$conn->query('UPDATE quiz SET question="' . $question . '", option1="' . $option1 . '", option2="' . $option2 . '", option3="' . $option3 . '", option4="' . $option4 . '" WHERE id=' . $id);
