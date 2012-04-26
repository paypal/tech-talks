<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Thank you</title>
<script src="https://www.paypalobjects.com/js/external/dg.js"></script>
<script src="../../client/jquery-1.6.2.min.js" type="text/javascript"></script>
<script src="../../client/pptransact.js"></script>

<?php
require_once("pptransact.php");

$transact = new pptransact();
$data = explode("|", $_GET["data"]);
$returnObj = $transact->commitPayment($data[1], $_GET["PayerID"], $_GET["token"], $data[0], $data[2]);
?>

<script>

function parentExists() {
 	return (parent.location == window.location)? false : true;
}

function closeFlow(param) {
	
	pptransact.init('cf',true);
	
	if(!parentExists()) {
		var jsonData = $.parseJSON('<?= $returnObj ?>');
		pptransact.saveToLocalStorage(jsonData.userId,<?= $returnObj ?>,null);
		
		setTimeout ( forceCloseFlow, '3000' );
		
	} else {
		parent.pptransact.releaseDG(<?= $returnObj ?>);
	}
  
}

function forceCloseFlow() {

	//The page you want to redirect the user after successfully storing data in local storage.
	window.location.href = '../../index.html';
		
}

</script>
</head>

<body onload="closeFlow(false)">
<div style="background-color:#FFF;height:400px;width:300px; border-radius:8px;padding:20px;">
    Thank you for the purchase!  You will automatically return to your site in 3 seconds.
    <button id="close" onclick="forceCloseFlow();">return now</button>
</div>
</body>
</html>