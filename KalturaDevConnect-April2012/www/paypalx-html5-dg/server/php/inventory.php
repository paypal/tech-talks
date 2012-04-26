<?php
function getItem($itemId){
	/*
    $items = array(
        array(name => "Learning jQuery Mobile - Exercise 4",
              number => "0_7cprzfhg",
              qty => "1",
              taxamt => "0",
              amt => "1.00",
              desc => "Learn how to set the viewport on your mobile app",
              category => "Digital"),
        array(name => "Laser Cannon",
              number => "456",
              qty => "1",
              taxamt => "0",
              amt => "1.25",
              desc => "Lock and load!",
              category => "Digital"));
    */
	
	$items = getPlayList();
    $returnObj = array();
    for ($i = 0; $i < count($items); $i++){
        if ($items[$i]['number'] == $itemId){
            $returnObj = $items[$i];
        }
    }
    
    return $returnObj;
}


?>