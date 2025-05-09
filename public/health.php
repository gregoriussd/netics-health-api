<?php
if ($_SERVER['REQUEST_URI'] !== '/health') {
    http_response_code(404);
    exit;
}

header('Content-Type: application/json');

$uptime = shell_exec("awk '{print $1}' /proc/uptime");
$uptime_formatted = gmdate("Y-m-d H:i:s", (int) $uptime);

echo json_encode([
    "nama" => "Gregorius Setiadharma",
    "nrp" => "5025231268",
    "status" => "UP",
    "timestamp" => date("Y-m-d H:i:s"),
    "uptime" => $uptime_formatted
], JSON_PRETTY_PRINT);
