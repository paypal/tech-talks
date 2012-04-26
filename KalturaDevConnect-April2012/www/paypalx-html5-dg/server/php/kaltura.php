<?php

require_once "client/KalturaClient.php";

function getSession($itemId,$userId){
	
	define("PARTNER_ID", "905501");
	define("USER_SECRET", "5928ea68c482634c67c4e3d6c21daed8");
	define("ENTRY_ID", $itemId);
	$user = $userId; 

	//Create a session
	$conf = new KalturaConfiguration(PARTNER_ID);
	$client = new KalturaClient($conf);

	$session = $client->session->start(USER_SECRET, $user, KalturaSessionType::USER, PARTNER_ID, 86400, 'sview:'.$itemId);

	if (!isset($session)) {
		die("Could not establish Kaltura session with OLD session credentials. Please verify that you are using valid Kaltura partner credentials.");
	}

	$client->setKs($session);
	$flashvars .= 'ks=' . $session;
    
    return $flashvars;
}

function getPlayList(){
	
	// Your Kaltura partner credentials
	define("PARTNER_ID", "905501");
	define("ADMIN_SECRET", "039d38186baf88f661bac9dd6b6b5809");

	$user = "SomeoneWeKnow"; 
	$kconf = new KalturaConfiguration(PARTNER_ID);
	
	$kclient = new KalturaClient($kconf);
	$ksession = $kclient->session->start(ADMIN_SECRET, $user, KalturaSessionType::ADMIN);
	if (!isset($ksession)) {
			die("Could not establish Kaltura session. Please verify that you are using valid Kaltura partner credentials.");
	}
	$kclient->setKs($ksession);

	$result = $kclient->playlist->get('0_3x0phjri');
	
	$l = explode(",",$result->playlistContent); 
	
	foreach ($l as $key => $value) {
  	
		$filter = new KalturaMetadataFilter();
		$filter->objectIdEqual = $value;
		$metadata = $kclient->metadata->listAction($filter)->objects;
		
		$id = $metadata[0]->objectId;
		if (isset($metadata[0]->xml)) {
			$xml = $metadata[0]->xml;
			$meta = new SimpleXMLElement($xml);
			$amt = (string) $meta->Amt;
			$taxamt = (string) $meta->Taxamt;
		}
		
		
		$obj = array("name" => "Video", "number" => $value, "category" => "Digital", "desc" => "my video", "amt" => $amt, "taxamt" => $taxamt);
		$objArray[] = $obj;
	}
	 
    return $objArray;
}

?>