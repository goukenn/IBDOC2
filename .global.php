<?php

//
//bdoc generated xml
//

define("BDOC_FOP_DIR", dirname(__FILE__)."/Lib/fop-2.2/fop");


igk_sys_lib_ignore(dirname(__FILE__)."/Lib");


//get the type regex expression
function bdoc_typeRegex(){
    return "/^(?P<type>(block|var|lbl|txt|ltx|rad|chk|chb|drd|date|ssf_|tabs|grp|sstb))(?P<ns>(CBO))?((?P<action>(gs|ge|ps|pe))?(?P<attr>(i|b))?(?P<loop>(lp))?(?P<require>([r]))?(?P<lc>(lc))?(.)+)?/i";
}
//get the special type regex expression
function dboc_specialTypeRegex(){
    return "/^(?P<type>(block|var|lblpe))/i";
}
function bdoc_get_sign($sign){
    $tab = [
        "ophtalmo_ophtalmo"=>"Ophtalmo3BlockSignature"
    ];
    return igk_getv($tab, $sign,  "SignGradeGeneriqueInitialise");
}

///<summary>get style definition</summary>
function bdoc_get_style_defs(){
    $tab = [
        "dossier17.pParag"=>array(),
        "dossier17.pLigne"=>array(),
        "dossier17.Titre1"=>array(
            "font-size"=>"12pt", 
            "font-weight"=>"bold",
            "text-decoration"=>"underline",
            "padding-bottom"=>"2pt"
    ),
        "dossier.p"=>array(),
        "dossier17.Titre2"=>array(),
        "dossier17.Titre3"=>array(),
        "dossier17.Titre4"=>array(),
        "dossier17.Titre5"=>array(),
        "dossier17.Titre6"=>array(),
        "dossier.body"=>array("color"=>"grey")
];
return $tab;
}

function bdoc_get_styles(){
    
    $styles = [
        "line"=>"dossier17.pLigne",
        "para"=>"dossier17.pParag",
        "titre1"=>"dossier17.Titre1",
        "titre2"=>"dossier17.Titre2",
        "titre3"=>"dossier17.Titre3",
        "titre4"=>"dossier17.Titre4",
        "titre5"=>"dossier17.Titre5",
        "titre6"=>"dossier17.Titre6"
];
return $styles;
}
function bdoc_gen($o, $settings){
    $styles = bdoc_get_styles();


$settings->signature = igk_getv($o, "signaturecomposant") ?? "SignGradeGeneriqueInitialise";

    $m = bdoc_container();// $c->add("main");
    // $m->setTempFlag("RootNS", "bdoc_componentCreator_callback");
    // $m["xmlns:fo"] = "http://www.w3.org/1999/XSL/Format";
    // $m["xmlns:xsl"] = "http://www.w3.org/1999/XSL/Transform";
	// $m["xmlns:stp"] = "http://www.stpierre-bru.be";
	// $m["exclude-result-prefixes"] = "fo";
    // $m["version"]="1.0";
    $rgx = bdoc_typeRegex();
    $notconvert = [];

    $vars = bdoc_container();

    $m->add( $vars);
   
    // $m->RenderXML();
    // igk_exit();
   $current = $m;
   $conditions = null;
   $groupif = null;
   $debugview= 1;
   $v_lspace = null;
   $v_lcond = null; //store checked last condition
   $blockdeclaration = 0;
   $phrase  = 0;
   $space = 0;
   $vars = array();

    foreach($o->identifiers as $k=>$v){
      
        if (preg_match($rgx, $k, $tab)){

            $is_require = igk_getv($tab, "require") == 'r';
            $group = igk_getv($tab, "action", null);
    
            switch($group)
            {
                case "gs":
                //group start
                $current->addComment()->Content = strtoupper("Group start ".$k);
                $if = $current->addIf("");
                if ($phrase){                    
                    $current = $if->addFoInline()->setAttribute("xsl:use-attribute-sets", $styles["line"]);
                }else 
                    $current = $if->addFoBlock()->setAttribute("xsl:use-attribute-sets", $styles["para"]);
                $groupif[] = $if;
                $conditions =(object) ["p"=>$conditions, "v"=>[], "nodes"=>[], "require"=>array(), 
                "phrase"=>$conditions? igk_getv($conditions, "phrase") : 0 , //propage parent condition
                "space"=>$conditions? igk_getv($conditions, "space") : 0
            ];
                break;
                case "ps":
                //phrase start
                $current->addComment()->Content = "PHRASE START : ".$k;
                $if = $current->addIf("");
                $current = $if->addFoBlock()->setAttribute("xsl:use-attribute-sets", $styles["line"]);
                $groupif[] = $if;
                $conditions =(object) ["p"=>$conditions, "v"=>[], "nodes"=>[], "require"=>array(),
                 "phrase"=>1, 
                 "space"=>$conditions? igk_getv($conditions, "space") : 0,
                 "phrasenode"=>$current
                ];                
                break;
            }

            $path = "/";
            if ($conditions && $conditions->phrase){ 
                if ($conditions->space == 1)
                    $conditions->space = 2;
                else if ($conditions->space == 0) 
                    $conditions->space = 1;
            }

            //determinse that phrase mode is active
            $phrase  = $conditions && $conditions->phrase;
            $space  = $conditions && ($conditions->space == 2);

            //depending of type selection
            switch($tab["type"]){
                case "block": 
                    //special block type
                    igk_ilog("found block declaration : ".$k);
                    $block_n = substr($k, 5);
                    $file = dirname(__FILE__)."/templates/".$block_n.".xsl";
                    if (file_exists($file)){
                        $blockdeclaration = $block_n;
                        $current->addObData(function()use($file){
                            igk_wl(igk_io_read_allfile($file));
                        });
                        //skip next reading until next block found
                    }
                    break;
                case "txt":
                    $attr = igk_getv($tab, "attr", null);
                    $inline = ($phrase && $attr!="b") || ($attr =="i");
                    $conditionlast = igk_getv($tab, "lc") == "lc";

                    if ($phrase && !$inline ){
                        if($v_lspace)
                            igk_html_rm($v_lspace);
                        $current->addText()->Content = ".";
                    }
                    $cond = $path."/".$k."/text() != ''";
                    $if = $current->addIf($cond);
               
                    bdoc_bindcondition($conditions,
                         $cond,
                         $if, 
                         $is_require);
                    //}     
                    if ($debugview)
                    $if->addComment()->Content = "text content ";          
                    
                    
                    if (is_array($v)){
                        $if->addVariable("tcount", "count(".$path."/".$k."[text() != ''])");
                        $if->addVariable("appendAnd", 1);

                        $for = $if->addForEach( $path."/".$k."[text() != '']");
                        $for->addIf("(position()>1 ) and \$appendAnd and ((\$tcount ) >position())")
                        ->addText()->Content = " , ";
                        $for->addIf("(position()>1 ) and ((\$tcount ) = position())")
                        ->addText()->Content = " et ";
                        $for->addValue("current()/text()");

                    }else{
                        
                        if ($conditionlast){ //use last condition to view the node
                            $if->addVariable("lcount", "count({$v_lcond})");
                            $if->addIf("\$lcount > 0")->addText()->Content = " et ";
                        }


                        if ($inline){
                            if ($space && $phrase){
                                $if->addSpace();
                            }

                            $block = $if->addFoInline()->setAttribute("xsl:use-attribute-sets", $styles["line"]);
                        }else{
                            
                            $block = $if->addFoBlock()->setAttribute("xsl:use-attribute-sets", $styles["para"])
                            //$block = $block->addFoBlock()->setAttribute("xsl:use-attribute-sets", "dossier17.pLine")
                            ->setAttribute("linefeed-treatment", "preserve");
                        }
                        $block->addValue($path."/".$k."/text()");

                    }
                    break;
                case "ltx":
                    //inline text zone
                    $block = $if->addFoInline()->setAttribute("xsl:use-attribute-sets", $styles["line"])
                    ->setAttribute("linefeed-treatment", "preserve");
                    $block->addValue($path."/".$k."/text()");
                    break;

                case "date":
                    //render date time
                    // <xsl:call-template name="afficheDate">
					// 		<xsl:with-param select="/*/@patBirthDate" name="datetxt" />
                    // </xsl:call-template> 
                    if ($phrase && $space)//prepend space 
                        $if->addSpace();    
                    $current->addValue( $path."/".$k."/text()");
                    // $data = $current->addCallTemplate("afficheDate");
                    // $data->addWithParam("datetxt", $path."/".$k."/text()");
                break;


                case "lbl":
                    // igk_wln($k);
                    // igk_wln($tab);
                    // igk_exit();
                    //default
                    if ($group == "pe"){

                        while($conditions){
                            $ph = isset($conditions->phrasenode) ? $conditions->phrasenode : null;
                            if( $ph ==null)
                                 bdoc_endgroup($groupif, $conditions, $current);
                            else{
                                //phrase end
                            $ph->addText()->Content = ".";
                            break;
                            }
                        }

                        break;
                    }


                    $v_s = [];
                    $v_s["line"] =  $styles["line"];

                    $xmlStyle = igk_getv($v, "xmlStyle");

                    $sss = htmlspecialchars_decode(igk_getv($v, "label"));               


                    $g = igk_conf_load_content($sss, "span");
                    if ($g  && isset($g->class) ){
                        $xmlStyle.= " ".$g->class;
                    }
                    if ($xmlStyle){
                        foreach(explode(" ", $xmlStyle) as $tk=>$tv){
                            $tm = igk_getv($styles, $tv);
                            if($tm)
                                $v_s[$tv] = $tm;
                         }
                    }
                 
                    // igk_wln($v_s);
                    // igk_exit();
                    if ($debugview)
                    $current->addComment()->Content = $v->unformattedLabel;
                    $inline = $phrase ||  igk_getv($tab, "attr", null)=="i";
                    if ($inline){
                        $block = $current->addFoInline();
                    }else 
                        $block = $current->addFoBlock();
                    $block->setAttribute("xsl:use-attribute-sets", 
                    implode(" ", array_values($v_s)));

                    if ($phrase && $space)//prepend space 
                        $if->addSpace();

                    $block->addValue($path."/".$k."/@unformattedLabel");
                    break;
                case "rad":
                    //default radio view
                   // $current->addComment()->Content = "rad print value";
                    $cond = $path."/list/".$k."[text()='on']";
                    $if = $current->addIf($cond);
                    $block = $if->addFoBlock()->setAttribute("xsl:use-attribute-sets", $styles["line"]);
                    $block->addValue($path."/list/".$k."[text()='on']/@unformattedLabel");

                    bdoc_bindcondition($conditions, $cond, $if, $is_require);

                  
                break;
                case "drd": //dropbox
                     $inline = $phrase ||  ($bi =igk_getv($tab, "attr", null)) || (($bi!='b')&&(igk_count($v) == 1));
                     $cond = $path."/list/".$k."[text()='on']";
                     $if = $current->addIf($cond);
 
                     if ($inline){
                         if($debugview)
                             $if->addComment()->Content = $v[0]["unformattedLabel"];

                            if ($space && $phrase){
                            $if->addSpace();
                        }
                         $block = $if->addFoInline()->setAttribute("xsl:use-attribute-sets", $styles["line"]);
                         $block->addValue($path."/list/".$k."[text()='on']/@unformattedLabel");
                     }else{
                         $block = $if->addFoBlock()->setAttribute("xsl:use-attribute-sets", $styles["para"]);
                         $block->addValue($path."/list/".$k."[text()='on']/@unformattedLabel");
                     }
                     bdoc_bindcondition($conditions, $cond, $if, $is_require);
                break;
                case "img":
                case "draw":

                    $cond = $path."/".$k."/text()!='']";
                    $if = $current->addIf($cond);
                    $if->addVariable("tdata")["select"] =  $path."/".$k."/text()";
                    $img = $if->addFoImage("url(data:image/jpeg;base64,{\$tdata})");
                    //styling
                    // $img[""]
                    $img="scalling";

                    bdoc_bindcondition($conditions, $cond, $if, $is_require);
                     
                     break;
                     
                break;
                case "var": //get variable
                     $n = substr($k, 3);
                     $vars[$n] = htmlspecialchars_decode($v->unformattedLabel);              
                     break;
                case "chk":
                case "chb"://checkbox
                    //default  checkbox

                    // if ($k == "chklpChoixOctMac"){

                    //     igk_wln($tab);
                    //     igk_die("b:".$k);
                    // }
                     if (!is_array($v)){
                         $current->addComment()->Content = "{$k} is not a valid checkbox";
                     }
                     else{

                    //$current->addComment()->Content = "rad print value";
                    $inline = $phrase || ($bi =igk_getv($tab, "attr", null)) || (($bi!='b')&&(igk_count($v) == 1));
                    $isloop = (igk_count($v)!=1) && ( $phrase || (igk_getv($tab, "loop") == "lp"));
                    $cond = $path."/list/".$k."[text()='on']";
                    $if = $current->addIf($cond);

            

                    if ($isloop){
                        $v_icond ="";

                        bdoc_ignoreList($k, $o, $if , $v_icond, $path);
                        
                        if ($phrase && $space)//prepend space
                            $if->addSpace();
                        if (!empty($v_icond)){
                            $cond = $path."/list/".$k."[text()='on' and ".$v_icond."]";                        
                            
                        }else 
                            $cond = $path."/list/".$k."[text()='on']";
                        $v_lcond = $cond;
                        $if->addVariable("tcount")["select"] = "count({$cond})";
                        $if->addVariable("appendAnd", igk_getv($vars, "appendAnd", 1));
                        $for = $if->addForEach($cond);
                        

                        
                        $for->addIf("(position() > 1) and \$appendAnd and (position() = \$tcount)")->Content = " et ";  
                        $for->addIf("(position() > 1) and ((\$appendAnd=false) or (\$tcount != position()))")->Content = ", ";                         
                        $for->addValue("current()/@unformattedLabel");

                    }else{
                        if ($inline){
                            if($debugview)
                                $if->addComment()->Content = $v[0]["unformattedLabel"];
                            if ($phrase && $space)//prepend 
                                $if->addSpace();

                            $block = $if->addFoInline()->setAttribute("xsl:use-attribute-sets", $styles["line"]);
                            $block->addValue($path."/list/".$k."[text()='on']/@unformattedLabel");
                        }else{
                            $block = $if->addFoBlock()->setAttribute("xsl:use-attribute-sets", $styles["para"]);
                            $block->addValue($path."/list/".$k."[text()='on']/@unformattedLabel");
                        }
                    }
                    bdoc_bindcondition($conditions, $cond, $if, $is_require);
                }
                break;

                default:
                    //default base label 
                    $current->addComment()->Content ="Default case :::::::::::::::::::::::::::::::::::::".$k;
                    $block = $current->addFoBlock()->setAttribute("xsl:use-attribute-sets", "dossier.p");
                    $block->addValue($path."/".$k."/@unformattedLabel");
                break;
            }
            if (($group == "ge") ||( $group == "pe" )){
            
                //END GROUP
                bdoc_endgroup($groupif, $conditions, $current);
            }
        }else{
            $notconvert[] = $k;
            if ($k == "subreport"){
                $n = $v["name"];
                $vars->addVariable($n)->setAttribute("select", $path."/subreport[@name='{$n}']");

                // igk_wln($v);
                // igk_exit();
            }
           //$block = $m->addFoBlock()->setAttribute("xsl:use-attribute-sets", "dossier.p")->setAttribute("bad", $k);
        }
    }
    //propage if condition to parent
    while(igk_count($groupif)>0){
         bdoc_endgroup($groupif, $conditions, $current);
    }
    return $m; //->Render();
}

function bdoc_endgroup(& $groupif, & $conditions , & $current){
       
    $gf = array_pop($groupif);
    // igk_exit();
    if ($gf && $conditions){
        $and = implode(" and ",  $conditions->require);
        $or = implode(" or ",  $conditions->v);

 

        if ($and && $or)
            $and = "({$and}) and (".$or.")";


        $s = $gf["test"];

        $g = ( $and? $and: $or);
        if ($g){
            $g = !empty( $s ) ?"(".$g.") or ".$s   : $g;          
        }
        $gf["test"] = $g;
        $current = $gf->parentNode;
        $current->addComment()->Content = "END GROUP";
        if ( ($c  = igk_count($groupif)) >0){ //send to parent
            $bif = $groupif[$c-1];
            $bif["test"] = !empty($s = $bif["test"]) ? $s . " or (".$g.")" : $g;
        }
    }
    if ($conditions) {
        if (igk_count($conditions->nodes) == 1){
            $conditions->nodes[0]->setCallback("getIsRenderTagName", "return false;");             
        }
        if ($conditions->p){
            $conditions->p->nodes = array_merge($conditions->p->nodes, $conditions->nodes);
        }
        $conditions = $conditions->p;
    }
}
function bdoc_bindcondition(& $conditions, $cond, $if, $require=0){

    if ($conditions == null)
         $conditions = (object)["p"=>null, 
         "v"=>array(), 
         "require"=>array(),
         "nodes"=>null];
    if ($require)
        $conditions->require[] = $cond;
    else
        $conditions->v[] = $cond;
    $conditions->nodes[] = $if;
}
function bdoc_createForm($bformid, $descr=null){
	$n = igk_createXMLNode($bformid);
	$n["descr"] = $descr;
	$n["site"]= "SP";
	$n["ver"] = -35;
	$n["spec"] = "reporteditor";
	
	//set callback creator
	$n->setTempFlag("RootNS", "bdoc_componentCreator_callback");
	return $n;
}

function bdoc_createComponent($tag){
	$n = igk_createXMLNode($tag);
	$n["toPrint"] = "0";
	$n["xmlStyle"] = "";
	$n["nextField"] = "";
	$n["identation"] = "";
	$n["isModified"] = "";
	$n["unformattedLabel"] = "";
	$n["style"] = "";
	$n["title"] = "0";
	$n["newline"] = "0";
	return $n;
}

function bdoc_componentCreator_callback($name, $args){
	$fc = "bdoc_create".$name;
	if (function_exists($fc)){
        if ($args === null){
            igk_die("failed to create ".$name);
        }
		return call_user_func_array($fc, $args);
    }
    if ($args==null){
        $args = array($name);
    }else{
        $args = array_merge(array($name), $args);
    }
	return call_user_func_array(array(IGKXmlNode::class, "CreateWebNode"), $args);
}

function bdoc_createBandeau($name=null){
	$d = bdoc_createComponent("specialitecomposant");
	$d->Content = $name;
	$n["style"] = "hidden";
	$n["title"] = "0";
	$n["newline"] = "1";
	return $d;
}
function bdoc_createDiagnostics(){
	$d = bdoc_createComponent("diagnostics");
	$d->Content = $name;
	return $d;
}
function bdoc_createCssLink($tag, $uri){
	$d = bdoc_createComponent($tag);
	$d["label"] = htmlentities("<link ref=\"stylesheet\" type=\"text/css\" href=\"{$uri}\" />");
	$d->Content = $name;
	return $d;
}

function bdoc_createJsLink($tag, $uri){
	$d = bdoc_createComponent($tag);
	$d["label"] = htmlspecialchars("<div class=\"spacer\"><script ref=\"stylesheet\" type=\"text/css\" href=\"{$uri}\" ></script></div>");
	$d->Content = $name;
	return $d;
}

function bdoc_createXSL(){
	$n = igk_createXsltNode();
	$n["xmlns:fo"] = "http://www.w3.org/1999/XSL/Format";
	$n["xmlns:stp"] = "http://www.stpierre-bru.be";
	$n["exclude-result-prefixes"] = "fo";
    $n["version"]="1.0";
    
    $n->setTempFlag("RootNS", "bdoc_componentCreator_callback");
	return $n;
}

function bdoc_createFoInline(){
    $n = new bdocFooInline();
    return $n;
}
function bdoc_createFoBlock(){
    $n = igk_createXmlNode("fo:block");
    return $n;
}

function bdoc_createImport(){
    $n =  igk_createXmlNode("xsl:import");
    return $n;
}
function bdoc_createInclude(){
    $n =  igk_createXmlNode("xsl:include");
    return $n; 
}
function bdoc_createVariable($name, $select=null){
    $n =  igk_createXmlNode("xsl:variable");
    $n["name"] = $name;
    $n["select"]= $select;
    return $n;
}

function bdoc_createForeach($select){
    $n =  igk_createXmlNode("xsl:for-each");
    $n["select"] = $select;
    return $n;
}

function bdoc_createTemplate($path="/", $name=null){
    $n =  igk_createXmlNode("xsl:template");
    $n["match"] = $path;
    $n["name"] = $name;
    return $n;
}

function bdoc_createCallTemplate($name){
    $n =  igk_createXmlNode("xsl:call-template");
    $n["name"] = $name;
    return $n;
}

function bdoc_createIf($test=""){
    $n =  igk_createXmlNode("xsl:if");
    $n["test"] = $test;
    return $n;
}
function bdoc_createChoose(){
    $n =  igk_createXmlNode("xsl:choose");
    return $n;
}
function bdoc_createWhen($test=""){
    $n =  igk_createXmlNode("xsl:when");
    $n["test"] = $test;
    return $n;
}
function bdoc_createOtherwise(){
    $n =  igk_createXmlNode("xsl:otherwise");
    return $n;
}
function bdoc_createComment(){
    $n =  igk_createNode("comment");
    return $n;
}
function bdoc_createValue($select){
    $n =  igk_createNode("xsl:value-of");
    $n["select"] = $select;
    return $n;
}
function bdoc_createText(){
    $n =  igk_createNode("xsl:text");
    return $n;
}
function bdoc_createSpace(){
    $n =  igk_createNode("xsl:text");
    $n->Content = "&#x20;";
    return $n;
}
function bdoc_container(){
    $f = igk_createNode("NoTagNode");
    
    $f->setTempFlag("RootNS", "bdoc_componentCreator_callback");
    return $f;
}
function bdoc_createPatFullName(){
    $f = igk_createNode("NoTagNode");
    
    $f->setTempFlag("RootNS", "bdoc_componentCreator_callback");
    $f->addValue("/*/@patLastName");            
    $f->addText()->Content = "&#x20;";
    $f->addValue("/*/@patFirstName");
    return $f;
}

function bdoc_createPatBirthDate(){
    $f = bdoc_container();    
    $t = $f->addCallTemplate("afficheDate");   
    $t->addWithParam("datetxt", "/*/@patBirthDate");
    return $f;
}


function bdoc_createWithParam($name, $select){
    $f = igk_createNode("xsl:with-param");  
    $f["select"] = $select;
    $f["name"] = $name;
    return $f;
}

function bdoc_createBdocXmlNode($tag){
    return igk_createXmlNode($tag);
}

function bdoc_createAttributeSet($name){
    return igk_createXmlNode("xsl:attribute-set")->setAttribute("name", $name);
}
function bdoc_createAttribute($name, $value){
    $n = igk_createXmlNode("xsl:attribute");
    $n["name"] = $name;
    $n->Content = $value;
    return $n;
}

function bdoc_version(){
    return "1.0";
}
function bdoc_gen_header($bform, $settings){
        
    $bform->addComment()->Content = "version: ".bdoc_version();
    $bform->addComment()->Content = "TXT StyleSheet";
    $bform->addComment()->Content = "Author: CBO";
    $bform->addComment()->Content = "Date:".date("Y/m/d");
    $bform->addComment()->Content = "bForm :".$settings->name;
}
function bdoc_gen_bind_styles($bform){
    $tab = bdoc_get_style_defs();
    foreach($tab as $k=>$v){
        $attrs = $bform->addAttributeSet($k);
        foreach($v as $v_x=>$v_y){
            $attrs->addAttribute($v_x, $v_y);
        }   
    }
}
function bdoc_init_text($bform, $settings=null){
  bdoc_gen_header($bform, $settings);


    if (!igk_is_debug()){
         $bform->addImport()->setAttribute("href", new bdocTemplateUri( "xsl-txt/call-template_stp_xsltxt.xsl"));
        $bform->addInclude()->setAttribute("href", new bdocTemplateUri("xsl-txt/style-page_xsltxt.xsl"));
    }else{

    // <xsl:attribute-set name="dossier17.pParag">
    //   <xsl:attribute name="color">red</xsl:attribute>
    // </xsl:attribute-set>
        //initialize custom attribute set
        bdoc_gen_bind_styles($bform);

        // $tab = bdoc_get_style_defs();
        // foreach($tab as $k=>$v){
        //     $attrs = $bform->addAttributeSet($k);
        //     foreach($v as $v_x=>$v_y){
        //         $attrs->addAttribute($v_x, $v_y);
        //     }   
        // }
        //debuging template
        $bform->addTemplate(null, "afficheDate")->addText()->Content = "[[Date]]";
    }
    
        $bform->addVariable("SpecialiteComposant", "//specialitecomposant/text()"); 
        $bform->addVariable("ConversionTable", new bdocTemplateUri("conversion_spelogotitres.xml", 1)); 
        $bform->addVariable("NoteDate", "/*/@noteDate");
        $bform->addVariable("Sexe", "/*/@patSex");
        $bform->addComment()->Content = "VARIABLES NOM, PRENOM, INTRO, ETC";
        $bform->addVariable("CourrierIntroVarM")->addComment()->setContent("TEXTE D'INTRO MASCULIN");
        $bform->addVariable("CourrierIntroVarF")->addComment()->setContent("TEXTE D'INTRO FEMININ");
        $template = $bform->addTemplate();

        $root = $template->addBdocXmlNode("fo:root");
        $root->addBdocXmlNode("fo:layout-master-set")
        ->addBdocXmlNode("fo:simple-page-master")->setAttributes(
            [
                "master-name"=>"simple",
                "page-height"=>"49.7cm",
                "page-width"=>"21cm"
            ]
        )->addBdocXmlNode("fo:region-body");

        $root->addBdocXmlNode("fo:page-sequence")
        ->setAttribute("master-reference", "simple")
        ->addBdocXmlNode("fo:flow")->setAttributes(
            [
                "flow-name"=>"xsl-region-body"
            ]
        )->addCallTemplate("dossier");


        $main = bdoc_container();
        $template = $bform->addTemplate(null, "dossier");
        //tab 1
        $tab = $template->addBdocXmlNode("fo:table")->setAttributes([
            "table-layout"=>"fixed",
            "width"=>"100%",
            "font-family"=>"Courier" ,
            "font-size"=>"7.3pt",
            "line-height"=>"10.5pt"
        ]);
        $tab->addBdocXmlNode("fo:table-column")->setAttributes([
            "column-width"=>"15cm"
        ]);
        $body = $tab->addBdocXmlNode("fo:table-body");

        //header raw
        $raw1 = $body->addBdocXmlNode("fo:table-row");
        $cell = $raw1->addBdocXmlNode("fo:table-cell");
        $cell->addBdocXmlNode("fo:block")
        ->setAttributes([
            "white-space-collapse"=>"false",
            "wrap-option"=>"no-wrap"
        ])
        ->addText()->Content ="CHU Saint-Pierre - UCM Sint-Pieter"
        ;
        $cell->addBdocXmlNode("fo:block")
        ->setAttributes([
            "white-space-collapse"=>"false",
            "wrap-option"=>"no-wrap"
        ])
        ->addText()->Content ="Rue Haute, 322, Hoogstraat"
        ;

        $cell->addBdocXmlNode("fo:block")
        ->setAttributes([
            "white-space-collapse"=>"false",
            "wrap-option"=>"no-wrap"
        ])
        ->addText()->Content ="1000 Brussel - Tèl.: 02 535 31 11"
        ;



        $raw1 = $body->addBdocXmlNode("fo:table-row");
        $raw1->addBdocXmlNode("fo:table-cell")
        ->addBdocXmlNode("fo:block")
        ->setAttributes([
            "white-space-collapse"=>"false",
            "wrap-option"=>"no-wrap"
        ])
        ->addSpace()
        ;



        $raw1 = $body->addBdocXmlNode("fo:table-row");
        $cell =  $raw1->addBdocXmlNode("fo:table-cell");
        $cell->addBdocXmlNode("fo:block")
        ->setAttributes([
            "white-space-collapse"=>"false",
            "wrap-option"=>"no-wrap"
        ])
        ->addSpace()
        ;


        $raw1 = $body->addBdocXmlNode("fo:table-row");
        $cell = $raw1->addBdocXmlNode("fo:table-cell");

        $cell->addBdocXmlNode("fo:block")
        ->setAttributes([
            "white-space-collapse"=>"false",
            "wrap-option"=>"no-wrap"
        ])
        ->addSpace()
        ;

        //call patient
        if (!igk_is_debug()){//debug purpose
            $cell->addBdocXmlNode("fo:block")->addCallTemplate("ConcernezoneInfopatient");
        }else{
            $cell->addBdocXmlNode("fo:block")->addText()->Content = "ConcerneZonePatient";
        }
        $cell->addComment()->Content = "................................";
        $cell->addComment()->Content = 'DEBUT ZONE TEXT';        
        $cell->addComment()->Content = "................................";
        $cell->addFoBlock()->add($main);        
        $cell->addComment()->Content = 'FIN ZONE TEXT';



        //tab 2
        $tab = $template->addBdocXmlNode("fo:table")->setAttributes([
            "table-layout"=>"fixed",
            "width"=>"100%",
            "font-family"=>"Courier" ,
            "font-size"=>"7.3pt",
            "line-height"=>"10.5pt"
        ]);
        $tab->addBdocXmlNode("fo:table-column")->setAttributes([
            "column-width"=>"15cm"
        ]);
        $body = $tab->addBdocXmlNode("fo:table-body");

        $raw1 = $body->addBdocXmlNode("fo:table-row");
        $cell = $raw1->addBdocXmlNode("fo:table-cell");

        if (!igk_is_debug()){
        $cell->addBdocXmlNode("fo:block")
        ->addFoBlock()->addCallTemplate("copie_courrier");
        }
        else{
          
        $cell->addBdocXmlNode("fo:block")
        ->addFoBlock()->Content = "ConcerneZoneCopieCourrier";  
        }
        $callback = igk_getv($settings, "callback");
        if ($callback){
      

            $main->addComment()->Content = " DEBUT Zone contenu ";
            $main->add($callback($settings));
            $main->addComment()->Content = " FIN Zone contenu ";
        }
}
function bdoc_init_xsl($bform, $type="note", $settings=null){
    if ($settings == null)
        $settings = igk_createObj();
    switch($type){
        case "text":
        bdoc_init_text($bform, $settings);
        break;
        default:
        bdoc_gen_header($bform, $settings);

        if (!igk_is_debug()){
            $bform->addImport()->setAttribute("href", new bdocMasterUri());
        }else{
            //bind default settings for debugging
            $bform->addTemplate(null,"PolitesseCourrierFin");
            $bform->addTemplate(null,"SignGradeGeneriqueInitialise");
            $root = $bform->addTemplate(null,"callRootTemplateCourrierNoteStandard")->addBdocXmlNode("fo:root");

            $root->addBdocXmlNode("fo:layout-master-set")            
            ->addBdocXmlNode("fo:simple-page-master")->setAttributes([
            "master-name"=>"simple",
            "page-height"=>"49.7cm",
            "page-width"=>"21cm"
            ])->addBdocXmlNode("fo:region-body");


            $root->addBdocXmlNode("fo:page-sequence")->setAttribute("master-reference", "simple")->addBdocXmlNode("fo:flow")
            ->setAttribute("flow-name", "xsl-region-body")->addCallTemplate("dossier");

            $bform->addTemplate(null,"afficheDate");
            $bform->addTemplate(null,"TextIntroCourrier");
            $bform->addVariable("Sexe", "m");

            bdoc_gen_bind_styles($bform);
        }
            $bform->addComment()->Content = "Variables";
            $bform->addVariable("CourrierIntroVarM")->addComment()->setContent("TEXTE D'INTRO MASCULIN");
            $bform->addVariable("CourrierIntroVarF")->addComment()->setContent("TEXTE D'INTRO FEMININ");

            $bform->addComment()->Content = "FIN VARIABLES POUR LA PHRASE D'INTRO";
            $bform->addTemplate()->addCallTemplate("callRootTemplateCourrierNoteStandard");

            $t = $bform->addTemplate(null, "dossier");
            $main = $t->addFoBlock()->setAttribute("xsl:use-attribute-sets", "dossier.body");

            //$main->addIf("//chkIsCourrier[text()='on']")->addCallTemplate("TextIntroCourrier");
            //--
            $ch = $main->addChoose();
            $ch->addWhen("//chkIsCourrier[text()='on']")->addCallTemplate("TextIntroCourrier");
            $ch = $ch->addOtherwise()->addFoBlock()
            ->setAttribute("xsl:use-attribute-sets", "dossier17.pLigne")
            ->addChoose();
            $ch->addWhen("\$Sexe='f'")->addValue("\$CourrierIntroVarF");
            $ch->addOtherwise()->addValue("\$CourrierIntroVarM");
            //--

            //--content
            $main->addComment()->Content = "Main Content";

            //rapport hostipOpthalmo
            $block = $main->addFoBlock();
            //title patient
            $block->setAttribute("xsl:use-attribute-sets", "dossier.p");

            $ch = $block->addChoose();
            $f = $ch->addWhen("\$Sexe='f'");
            $f->addText()->Content = "Mme. ";
            $f->addPatFullName();
            $f->addSpace();
            $f->addText()->Content = ", née le ";
            $f->addPatBirthDate();            
            $f->addSpace();
            $f->addText()->Content = "a été hospitalisée en Opthamologie du ";
           

          
            $f = $ch->addOtherwise();
            
            $f->addText()->Content = "M. ";
            $f->addPatFullName();
            $f->addSpace();
            $f->addText()->Content = ", né le ";
            $f->addPatBirthDate();
            $f->addSpace();            
            $f->addText()->Content = "a été hospitalisé en Opthamologie du ";
            $f->addValue("//dateFrom/text()");
            $f->addText()->Content = " au ";
            $f->addValue("//dateTo/text()");


            

            $callback = igk_getv($settings, "callback");
            if ($callback){
                $main->addComment()->Content = "START GENERATE CONTENT";
                $main->add($callback($settings));
                $main->addComment()->Content = "END GENERATE CONTENT";
            }



            $main->addComment()->Content = "START Politesse";
            $po = $main->addIf("//chkIsCourrier[text()='on']");
            $po->addCallTemplate("PolitesseCourrierFin");
            $po->addCallTemplate(igk_getv($settings, "signature", "SignGradeGeneriqueInitialise"));
            $main->addComment()->Content = "END Politesse";
        break;
    }
}

function bdoc_get_templatefolder($option=null){
    if (igk_getv($option, "env", "test") == "test")
             return "http://sp1051:8080/include/template2016-copietravail/";
    return "http://sp1051:8080/include/template2016/";
}

function bdoc_ignoreList($k, $o, $if,  & $cond, $path){  
    $cond2 = "";
    if  (isset($o->ignore) && isset($o->ignore[$k])){

        if (is_array($o->ignore[$k])){
           
            
            foreach($o->ignore[$k] as $vv){
                if (!empty($cond2))
                    $cond2 .= " and ".
                $cond2 .= "@value != ".$vv->value;  
            }

        }
        else{
            $v_bc = $o->ignore[$k]->value;
            $cond2 = "@value != ".$v_bc;                             
        }
        $cond = $cond2; //('('.$cond . " and (".$cond2."))");
        
        // igk_wln("last"); 
        // igk_wln($cond);
        // igk_exit();                        
    }
}

class bdocMasterUri implements IIGKHtmlGetValue{
    public function getValue($option=null){
        return bdoc_get_templatefolder($option)."master-page.xsl";
    }
}
class bdocTemplateUri implements IIGKHtmlGetValue{
    var $buri;
    var $enclose;
    public function __construct($u, $enclose=0){
        $this->buri = $u;
        $this->enclose = $enclose;
    }
    public function getValue($option=null){
        $s = bdoc_get_templatefolder($option).$this->buri;
        if ($this->enclose){
            $s = "'".$s."'";
        }
        return $s;
    }
}

class bdocFooInline extends IGKXmlNode{
    private $m_viewTagNode;
    public function __construct($tag="fo:inline"){
        parent::__construct($tag);
        $this->m_viewTagNode = 1;
    }
    public function getIsRenderTagName(){
        return $this->m_viewTagNode;
    }

    public function __AcceptRender($option = null){
        if (igk_getv($option , "bdoccontext") == "text"){
            $this->m_viewTagNode = 0;
        }else
            $this->m_viewTagNode = 1;
        // igk_wln($this->m_viewTagNode);
        // igk_exit();
        return 1;
    }
}


class bdocFooImage extends bdocFooInline{
    public function __construct($src){
        parent::__construct("fo:external");
        $this["src"] = $src;
    }
}

function igk_bdoc_view_bform_table($ctrl, $dv, $forms, $fname){
$table = $dv->addPanelBox()->setClass("overflow-x-a")->addTable();
	$tr = $table->add("tr");
	IGKHtmlUtils::AddToggleAllCheckboxTh($tr);
	$tr->add("th")->Content = "Name";
	$tr->add("th")->Content = "Date";
	$tr->add("th")->Content = "Title";
	$tr->add("th")->Content = "Bandeau";
	$tr->add("th")->Content = "Long Description";
	$tr->add("th")->Content = "Short Description";
	$tr->add("th")->Content = "Ticket";
	$tr->add("th")->addSpace();
	$tr->add("th")->addSpace();
	foreach($forms->Rows  as $k=>$v){
		$tr = $table->add("tr");
		$tr->add("td")->addBMCCheckbox("f", $v->clId, true);
		$tr->add("td")->Content = $v->clName;
		$tr->add("td")->Content = $v->clDate;
		$tr->add("td")->Content = $v->clTitle;
		$tr->add("td")->Content = "pedia_pedia";
		$tr->add("td")->Content = $v->clLongDesc;
		$tr->add("td")->Content = $v->clShortDesc;
		$tr->add("td")->Content = $v->clTicket;
		$tr->add("td")->addAJXA($ctrl->getAppUri($fname."/edit"))->Content = igk_svg_use("edit");
		$tr->add("td")->addAJXA($ctrl->getAppUri($fname."/drop/".$v->clId))->Content = igk_svg_use("drop");
	
	}
	
}
?>