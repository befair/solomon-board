<html>
<body>
<p>Reboot device to complete!</p>
<br>
<?php

$vconf = $_POST["conf"];
$vssid = $_POST["ssid"];
$vpsw = $_POST["password"];
$apice = '"';

$file = fopen("/var/lib/wifi_config.txt", "w") or die("Unable to open file!");

fwrite($file, "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev\n");
fwrite($file, "update_config=1\n");

fwrite($file, "network={\n");
fwrite($file,	"ssid=$apice$vssid$apice\n");
fwrite($file,	"psk=$apice$vpsw$apice\n");
fwrite($file, "}\n");

fclose($file);

$file_invt = fopen("/var/lib/wifi_config_invt.txt", "w") or die("Unable to open file!");
fwrite($file_invt, "$vconf");
$fclose($file_invt);
?>
</body>
</html>

