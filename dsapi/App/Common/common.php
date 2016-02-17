<?php
function parseProduct($products){
	$arr=array();
	$imgModel=M("images");
	for($i=0;$i<count($products);$i++){
		$product=$products[$i];
		$image_id=$product["image_id"];
		$img=$imgModel->field("savepath")->find($image_id);
		$savepath=$img["savepath"];
		$product["savepath"]=$savepath;
		array_push($arr,$product);
	}
	return $arr;
}
function getImagePathById($image_id){
	$imgModel=M("images");
	$img=$imgModel->field("savepath")->find($image_id);
	$savepath=$img["savepath"];
	return $savepath;
}
?>