<?php
function verifyUser($userId = 0){
    $YourSessionUserId = '888888';
    
    $returnVal = ($userId == $YourSessionUserId) ? true : false;
    return $returnVal;
}

function getUserId(){
    $result = "888888";
    return $result;
}

function recordPayment($paymentObj = ""){
    $userId = $paymentObj["userId"];
    $itemId = $paymentObj["itemId"];
    $transactionId = $paymentObj["transactionId"];
    $paymentStatus = $paymentObj["paymentStatus"];
    $orderTime = $paymentObj["orderTime"];
        
    //INSERT YOUR CODE TO SAVE THE PAYMENT DATA
}
    
function verifyPayment($userId = 0, $itemId = 0){
    $result = false;
    
    //INSERT YOUR CODE TO QUERY PAYMENT DATA and RETURN TRUE if MATCH FOUND
    
    return $result;
}

function getPayment($userId = 0, $itemId = 0){
    //INSERT YOUR CODE TO QUERY PAYMENT DATA and RETURN PAYMENT STRUCTURE
    
    $returnObj = array("success" => true,
                       "error" => "",
                       "transactionId" => "12345678",
                       "orderTime" => "2011-09-29T04:47:51Z",
                       "paymentStatus" => "Pending",
                       "itemId" => "123",
                       "userId" => "888888");
    
    return $returnObj;
}
?>