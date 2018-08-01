"use strict";

(function(){

	var bform = {};

	igk.system.createNS("igk.bform", {
		addElement:function(j){
			
		},
		initBform: function(obj){
			bform.setting = obj;
		},	
		load:function(){
			var sc = igk.getCurrentScript();
			var txt = sc.innerHTML.substring(2);
			txt = txt.substring(0, txt.indexOf("*/",-1));
			var obj = txt.replace(/:%([^%]*)%/g, function(s,t ){
					return ":\""+t+"\"";
			});
			igk.bform.addElement(obj);
		},		
		addElement: function(obj){
			
			var tobj = null;
			try{
				tobj = JSON.stringify(obj);
			}
			catch{
				console.erro("error : ");
				return;
			}			
			if (!tobj){
				
				console.debug("error on : "+obj);
			}			
			if (typeof(bform.elements) =='undefined')
				bform.elements = [];			
			bform.elements.push(obj);
			return 1;
		},
		getCount:function(){
			return bform.elements.length;
		}
		
	});

})();