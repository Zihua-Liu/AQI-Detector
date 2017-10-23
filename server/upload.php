<?php 
function receiveStreamFile($receiveFile){   
    $streamData = isset($GLOBALS['HTTP_RAW_POST_DATA'])? $GLOBALS['HTTP_RAW_POST_DATA'] : ''; 
   
    if(empty($streamData)){ 
        $streamData = file_get_contents('php://input'); 
    } 
   
    if($streamData!=''){ 
        $ret = file_put_contents($receiveFile, $streamData, true); 
    }else{ 
        $ret = false; 
    } 
  
    return $ret;   
} 
 
$receiveFile =  $_SERVER["DOCUMENT_ROOT"]."/uploadFiles/hangge.png"; 
$suc = receiveStreamFile($receiveFile); 
$suc = true;
if ((bool)$suc){
    exec("/home/2016/y2016g31/Python/bin/python3 /home/2016/y2016g31/apache/htdocs/aqi.py /home/2016/y2016g31/apache/htdocs/uploadFiles/hangge.png", $arr, $ret);
}
else{
    $ret = -1;
    $arr = array(-1);
}
echo json_encode((int)($arr[0])); 
?>
