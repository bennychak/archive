function m_over(obj){
	if(obj.className=="s_out"){
		obj.className="s_over";
	}
}

function m_out(obj){
	if(obj.className=="s_over"){
		obj.className="s_out";
	}
}
function c_chang(obj){
	var e=obj.parentNode.parentNode;
	if(e.className=="s_over"){
		e.className="s_click";
	}else{
		e.className="s_over";
	}
}
function CheckAll(form){
	for (var i=0;i<form.elements.length;i++){
		var e = form.elements[i];
		if (e.name != 'chkall'){
			e.checked = form.chkall.checked;
		}
		if(e.type == 'checkbox' && e.name != 'chkall' && e.name != 'chkall_box2'){
			var obj = e.parentNode.parentNode;
			e.checked ? obj.className="s_click" : obj.className="s_out";
		}
	}
}
function getSelect(form){
	var ids='';
	for (var i=0;i<form.elements.length;i++) {
		var e = form.elements[i];
		if(e.type == 'checkbox' && e.name != 'chkall' && e.name != 'chkall_box2'){
			if(e.checked) ids += e.value + ',';
		}
	}
	return ids.replace(/,$/mg, "");;
}