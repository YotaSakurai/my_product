<?php
$fh = fopen("https://www.ibm.com/developerworks/jp/opensource/library/os-php-readfiles/index.html", "r");
$fp = fopen("gets.txt", "ab");
while(!feof($fh)){
    $line = fgets($fh);
    //$fp = fwrite($fp, $line);
    echo $line;
}
$fp = fwrite($fp, "Hello");
fclose($fh);
fclose($fp); 