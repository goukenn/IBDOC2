<?php
//*
//author:C.A.D. BONDJE DOUE
//description:
//created:2018-30-04_12:05:51
//copyright: IGKDEV &copy; 2011-2018 all rights reserved
//*

//
//controller code class declaration
//file is a part of the controller tab list
//

///<summary>sp document form</summary>
class app_spBdoc extends IGKAppCtrl {
	private static $sm_db;
	public function getName(){return get_class($this);}
	
	protected function getInitDbConstraintKey(){
		return "bform";
	}
	protected function InitComplete(){
		parent::InitComplete();
		//please enter your controller declaration complete here

	}
	
	protected function getContextViewArgs(){
		return array();
	}
	///<summary> init target node</summary>
	protected function initTargetNode(){
		$node =  parent::initTargetNode();
		return $node;
	}
	//----------------------------------------
	//Please Enter your code declaration here
	//----------------------------------------

	///<summary>override to handle your custum view mecanism</summary>
	//public function View(){
	//	parent::View();
	//}
	public function openXSL(){}
	public function closeXSL(){
		
	}	
	
	public function getDb(){
		return self::$sm_db ?? self::$sm_db = new app_spBdocDbUtility($this);
	}
}


///<summary>spBdoc db utility class</summary>
class app_spBdocDbUtility extends IGKDBUtility{

	public function __construct($app){
		parent::__construct($app);
	}
	
	public function getUserId(){
		return ($u = $this->getCtrl()->getUser()) ? $u->clId: -1;
	}
	
	public function getForms($uid=null){
		if ($this->connect()){
			$r = $this->select("bforms", $uid ? ["clUser_Id"=>$uid] : null);
			if ($r){
				$r = $r->sortBy("clDate", 0);
			}
			$this->close();
			return $r;
		}
		return null;
	}
	
	public function dropForm($uid, $id){
	if ($this->connect()){
			$r = $this->delete("bforms", array("clUser_Id"=>$uid , "clId"=>$id), null);			
			$this->close();
			return $r;
		}
		return null;
	}
	public function getCats(){
		if ($this->connect()){
			$r = $this->select("bcats");
			$this->close();
			return $r;
		}
		return null;
	}
	
	public function getBandeaux(){
		if ($this->connect()){
			$r = $this->select("bbandeaux");
			$this->close();
			//to array
			if ($r){
				$tab = [];
				foreach($r->Rows as $k=>$v){
					$tab[$v->clId] = $v->clName; 
				}
				return $tab;
			}
			
			return $r;
		}
		return null;
	}
	
	public function addFormsRequest(& $errors=null){
		$b = igk_get_robj();

		if (!igk_html_form_validate($b, 
		[
			"clName"=>R::gets("No Name"),
			"clTicket"=>["Regex"=>"/^(|[0-9]+)$/i", "Message"=>R::gets("Ticket Not Valid")]
		], $errors)){		
			return 0;		
		}		
		
		$b = igk_db_create_row("bforms", $b);
	
		
		
		if ($this->connect()){
		
			$b->clUser_Id = $this->getCtrl()->getUser()->clId;
		
			$r = $this->insert("bforms", $b);
			$this->close();
			return $r;
		}		
		return 0;
	}
	
}
?>