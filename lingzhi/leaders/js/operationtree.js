var selectedID
function selectNode(item){
	selectedID=item.replace("l","");
	if(selectedID!=0){
		del_node.disabled="";
		edit_node.disabled="";
	}else{
		del_node.disabled="true";
		edit_node.disabled="true";
	}
}

function operationNode(action){
	switch(action){
		case "del":
			location='operation.asp?action=delcategory&id='+selectedID
		break;

		case "edit":
			location='category_edit.asp?id='+selectedID
		break;
	}
}