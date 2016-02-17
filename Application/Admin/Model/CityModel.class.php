<?php
namespace Admin\Model;
use Think\Model;
class CityModel extends Model {
    public function addprovince() {
        $M = M("City");
        $data['name']=I('post.name');
		$data['pid']=0;
		$arr='';
		
		if($M->add($data)){
			$arr=array('status' => 1, 'info' => '添加成功！','url' => U('Siteinfo/city'));
		}else{
			$arr=array('status' => 0, 'info' => "添加失败！");
		}
		return $arr;
    }
	public function addcity() {
        $M = M("City");
        $data['name']=I('post.name');
		$data['pid']=I('post.pid');
		$arr='';
		
		if($M->add($data)){
			$arr=array('status' => 1, 'info' => '添加成功！','url' => U('Siteinfo/city'));
		}else{
			$arr=array('status' => 0, 'info' => "添加失败！");
		}
		return $arr;
    }
	public function listNationality($firstRow = 0, $listRows = 20){
		$M = M("Nationality");
        $list = $M->limit("$firstRow , $listRows")->select();
        return $list;
	}
	function edit(){
		$M = M("Wxhd");
		$data['id']=I('post.id');
        $data['title']=I('post.title');
		$data['endtime']=strtotime(I('post.endtime'));
		$data['image']=I('post.image');
		$data['status']=I('post.status');
		$data['srcoe']=I('post.srcoe');
		$data['summary']=I('post.summary');
		$data['content']=I('post.content');
		$data['phone']=I('post.phone');
		$data['limit']=I('post.limit');
		$arr='';
		//$arr=$data;
		if($M->save($data)){
			$arr=array('status' => 1, 'info' => '更新成功！','url' => U('Siteinfo/wxmanager'));
		}else{
			$arr=array('status' => 0, 'info' => "更新失败！","sql"=>$M->getLastSql());
		}
		return $arr;
	}
}

?>
