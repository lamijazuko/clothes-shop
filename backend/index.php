<?php
// index.php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

echo json_encode(["message" => "LamijaZuko API is running."]);
?>
