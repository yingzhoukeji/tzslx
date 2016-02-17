<?php
/**
 * 微信操作控制器
 * Created by PhpStorm.
 * User: cony
 * Date: 14-02-27
 * Time: 上午9:22
 */
namespace Home\Controller;
use Think\Controller;
use Org\Util\Wechat;
use Org\phpqrcode\phpqrcode;
class RegisterController extends Controller {
    /**
     * 接口地址
     * @return string
     */
    public function index(){
		$model_nationality=M("nationality");
		$nationalitys=$model_nationality->select();
		$model_city=M("city");
		$province=$model_city->where("parentid=0")->order("sort asc")->select();
		$deflautcity=$model_city->where("parentid=12")->order("sort asc")->select();
		$this->assign("province", $province);
		$this->assign("deflautcity", $deflautcity);
		$this->assign("nationalitys", $nationalitys);
        $this->display();
    }
	public function typeone(){
		$type=(int)$_GET["type"];
		$this->assign("mytype", $type);
		$model_nationality=M("nationality");
		$nationalitys=$model_nationality->select();
		$model_city=M("city");
		$province=$model_city->where("parentid=0")->order("sort asc")->select();
		$deflautcity=$model_city->where("parentid=12")->order("sort asc")->select();
		$this->assign("province", $province);
		$this->assign("deflautcity", $deflautcity);
		$this->assign("nationalitys", $nationalitys);
        $this->display();
    }
	public function add(){
		$data=$_POST;
		
		$m=M("marathon");
		$check["telephone"]=$data["telephone"];
		$checkPhone=$m->where($check)->find();
		if($checkPhone){
			 $this->error("该手机号已注册！");
			 return;
		}
		$settingmodel=M("setting");
		$setting=$settingmodel->where(array('id'=>$data['type']))->find();
		$max=$setting['max'];
		$marathons=$m->where(array('type'=>$data['type']))->select();
		$count=count($marathons);
		if($count>=$max){
			 $this->error("对不起，报名人数已上限");
			 return;
		}
		$data["ip"]=get_client_ip();
		$data["createtime"]=date("Y-m-d H:i:s",time());
		$result=$m->add($data);
		if($result){
		  $type=$data["type"];
		   $id=$result;
		  $this->success('注册成功！',U('Register/wxpaycode?id='.$id.'&type='.$type));
		}else{
			 $this->error("报名失败！");
		}
	}
	public function qrcode(){
		$type=$_GET['type'];
		$id=$_GET['id'];
		Vendor('phpqrcode.phpqrcode');
	     $data = 'http://www.tzslx.com/regiser/home/querytopay.php?id='.$id.'&type='.$type;
		  $object = new \QRcode();
		  $object->png($data, false, 'L', 4, 2); 
	}
	public function wxpaycode(){
		$type=$_GET['type'];
		$id=$_GET['id'];
		$this->assign("wx_id", $id);
		$this->assign("wx_type", $type);
		$this->display();
	}
    public function query(){
		$this->display();
	}
	public function queryscore(){
		$this->display();
	}
	
	public function zhengshu(){
		$M=M("marathon");
		$marathon=$M->where(array('id'=>$_GET['id']))->find();
		$this->assign("info", $marathon);
		$this->display();
	}
	public function chengji(){
		$M=M("marathon");
		$marathon=$M->where(array('id'=>$_GET['id']))->find();
		$this->assign("info", $marathon);
		$this->display();
	}
}



