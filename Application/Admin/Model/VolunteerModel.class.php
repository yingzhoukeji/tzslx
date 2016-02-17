<?php
namespace Admin\Model;
use Think\Model;
class VolunteerModel extends Model {
	public function listVolunteer($firstRow = 0, $listRows = 20){
		$M = M("Volunteer");
        $list = $M->order("id DESC")->limit("$firstRow , $listRows")->select();
        return $list;
	}
}

?>
