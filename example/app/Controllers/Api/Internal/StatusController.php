<?php
namespace Controllers\Api\Internal;

class StatusController {
    public function check() {
        header('Content-Type: application/json');
        echo json_encode(['status' => 'ok']);
    }
}
