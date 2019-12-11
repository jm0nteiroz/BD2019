<?php

    $db = new mysqli('localhost', 'root', '', 'bd1');
    if (!$db) {
        die('Não foi possível conectar: '. mysql_error());
    }


?>
