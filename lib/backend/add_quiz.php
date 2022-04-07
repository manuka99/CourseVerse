<?php
include 'db_conn.php';
header("Access-Control-Allow-Origin: *");

$question = $_POST['question'];
$option1 = $_POST['option1'];
$option2 = $_POST['option2'];
$option3 = $_POST['option3'];
$option4 = $_POST['option4'];

$conn->query('INSERT INTO quiz (question, option1, option2, option3, option4)
VALUES("' . $question . '", "' . $option1 . '", "' . $option2 . '", "' . $option3 . '","' . $option4 . '")');
