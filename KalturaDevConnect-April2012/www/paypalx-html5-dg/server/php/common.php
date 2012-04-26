<?php
define("UID", "joncle_1313106572_biz_api1.yahoo.com");  // YOUR USER ID
define("PASSWORD", "1313106611");  // YOUR PASSWORD
define("SIG", "ANaR-mYnO4B1i2mTfRzVmOSN.sl5A14g.6GhzSklnxQeH8jwxB-57XZ2");  //  YOUR SIGNATURE
define("VER", "85");
define("URLBASE", "https://api-3t.sandbox.paypal.com/nvp");
define("URLREDIRECTINCONTEXT", "https://www.sandbox.paypal.com/incontext");
define("URLREDIRECT", "https://www.sandbox.paypal.com/webscr");

function parseString($string = null){
    $recordString = explode("&", $string);
    foreach ($recordString as $value){
        $singleRecord = explode("=", $value);
        $allRecords[$singleRecord[0]] = $singleRecord[1];
    }
        
    return $allRecords;
}
    
function runCurl($url, $postVals = null){
    $ch = curl_init($url);
        
    $options = array(
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT => 3
    );
        
    if ($postVals != null){
        $options[CURLOPT_POSTFIELDS] = $postVals;
        $options[CURLOPT_CUSTOMREQUEST] = "POST";  
    }
	
	$header = array(    		
    'X-PAYPAL-REQUEST-SOURCE' => 'HTML5 Toolkit PHP' 	
   	); 	 	

	$options[CURLOPT_HTTPHEADER] = $header;
        
    curl_setopt_array($ch, $options);
        
    $response = curl_exec($ch);
    curl_close($ch);
        
    return $response;
}
?>
