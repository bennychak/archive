/* Dynamic Folder Tree
 * Generates DHTML tree dynamically (on the fly).
 * License: GNU LGPL
 * 
 * Copyright (c) 2004, Vinicius Cubas Brand, Raphael Derosso Pereira
 * {viniciuscb,raphaelpereira} at users.sourceforge.net
 * All rights reserved.
 *
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */


// NODE 
//Usage: a = new dNode({id:2, caption:'tree root', url:'http://www.w3.org'});
function dNode(arrayProps) {
	//mandatory fields
	this.id;          //node id
	this.caption;     //node caption

	//optional fields
	this.url;         //url to open
	this.target;      //target to open url
	this.onClick;     //javascript to execute onclick
	this.onOpen;      //javascript to execute when a node of the tree opens
	this.onClose;     //javascript to execute when a node of the tree closes
	this.onFirstOpen; //javascript to execute only on the first open
	this.iconClosed;  //img.src of closed icon
	this.iconOpen;    //img.src of open icon
	this.runJS = true;       //(bool) if true, runs the on* props defined above
	this.plusSign = true;    //(bool) if the plus sign will appear or not
	this.captionClass = 'l'; //(string) the class for this node's caption


	//The parameters below are private
	this._opened = false; //already opened
	this._io = true; //is opened

	this._children = []; //references to children
	this._parent; //pointer to parent
	this._myTree; //pointer to myTree

	for (i in arrayProps)
	{
		if (i.charAt(0) != '_')
		{
			eval('this.'+i+' = arrayProps[\''+i+'\'];');
		}
	}
}

//changes node state from open to closed, and vice-versa
dNode.prototype.changeState = function()
{
	if (this._io)
	{
		this.close();
	}
	else
	{
		this.open();
	}

	//cons = COokie of Node Status
	//setCookie("cons"+this.id,this._io);
}

dNode.prototype.open = function () {
	if (!this._io)
	{
		if (!this._opened && this.runJS && this.onFirstOpen != null)
		{
			eval(this.onFirstOpen);
		}
		else if (this.runJS && this.onOpen != null)
		{
			eval(this.onOpen);
		}

		this._opened = true;
		this._io = true;
		this._refresh();
	}
}


dNode.prototype.close = function() {
	if (this._io)
	{
		if (this.runJS && this.onClose != null)
		{
			eval(this.onClose);
		}
		this._io = false;
		this._refresh();
	}
}

//alter node label and other properties
dNode.prototype.alter = function(arrayProps)
{
	for (i in arrayProps)
	{
		if (i != 'id' && i.charAt(0) != '_')
		{
			eval('this.'+i+' = arrayProps[\''+i+'\'];');
		}
	}
}

//css and dhtml refresh part
dNode.prototype._refresh = function() {
	var nodeDiv      = getObjectById("n"+this.id);
	var plusSpan     = getObjectById("p"+this.id);
	var captionSpan  = getObjectById("l"+this.id);
	var childrenDiv  = getObjectById("ch"+this.id);

	if (nodeDiv != null)
	{
		//Handling open and close: checks this._io and changes class as needed
		if (!this._io) //just closed
		{
			childrenDiv.className = "closed";
		}
		else //just opened
		{
			//prevents IE undesired behaviour when displaying empty DIVs
/*			if (this._children.length > 0) 
			{*/
				childrenDiv.className = "opened";
		//	}
		}

		plusSpan.innerHTML = this._properPlus();

		captionSpan.innerHTML = this.caption;
	}

//alter onLoad, etc

}

//gets the proper plus for this moment
dNode.prototype._properPlus = function()
{
	if (!this._io) 
	{
		if (this._myTree.useIcons)
		{
			return (this.plusSign)?imageHTML(this._myTree.icons.plus):"";
		}
		else
		{
			return (this.plusSign)?"+":"";
		}
	}
	else 
	{
		if (this._myTree.useIcons)
		{
			return (this.plusSign)?imageHTML(this._myTree.icons.minus):"";
		}
		else
		{
			return (this.plusSign)?"-":"";
		}
	}
}

//changes node to selected style class. Perform further actions.
dNode.prototype._select = function()
{

	var captionSpan;

	if (this._myTree._selected)
	{
		this._myTree._selected._unselect();
	}
	this._myTree._selected = this;
	
	captionSpan  = getObjectById("l"+this.id);

	//changes class to selected link
	if (captionSpan)
	{
		captionSpan.className = 'sl';
	}

}

//changes node to unselected style class. Perform further actions.
dNode.prototype._unselect = function()
{
	var captionSpan  = getObjectById("l"+this.id);

	this._myTree._lastSelected = this._myTree._selected;
	this._myTree._selected = null;

	//changes class to selected link
	if (captionSpan)
	{
		captionSpan.className = this.captionClass;
	}
}


//state can be open or closed
//warning: if drawed node is not child or root, bugs will happen
dNode.prototype._draw = function()
{
	var str;
	var div;
	var myClass = (this._io)? "opened" : "closed";
	var myPlus = this._properPlus();
	var append = true;
	var myPlusOnClick = this._myTree.name+'.getNodeById(\''+this.id+'\').changeState();';
	var captionOnClickEvent = "";
//	var cook;

	var plusEventHandler = function(){
		eval(myPlusOnClick);
	}

	var captionEventHandler = function(){
		eval(captionOnClickEvent);
	}

	
/*	if (this.myTree.followCookies)
	{
		this._io = getCookie("cons"+this.id);
	}*/

	//FIXME put this in a separate function, as this will be necessary in 
	//various parts

	captionOnClickEvent = this._myTree.name+'.getNodeById(\''+this.id+'\')._select(); ';
	if (this.onClick) //FIXME when onclick && url
	{
		captionOnClickEvent += this.onClick;
	}
	else if (this.url && this.target)
	{
		captionOnClickEvent += 'window.open(\''+this.url+'\',\''+this.target+'\')';
	}
	else if (this.url)
	{
		captionOnClickEvent += 'window.location=\''+this.url+'\'';
	}
	

	//The div of this node
	divN = document.createElement('div');
	divN.id = 'n'+this.id;
	divN.className = 'son';
	
	//The span that holds the plus/minus sign
	spanP = document.createElement('span');
	spanP.id = 'p'+this.id;
	spanP.className = 'plus';
//	spanP.addEventListener('click',plusEventHandler,false);
	spanP.onclick = plusEventHandler;
	spanP.innerHTML = myPlus;

	//The span that holds the label/caption
	spanL = document.createElement('span');
	//modify by Cwj.
	//spanL.id = this.id;
	spanL.id = 'l'+this.id;
	spanL.className = this.captionClass;
//	spanL.addEventListener('click',captionEventHandler,false);
	spanL.onclick = captionEventHandler;
	spanL.innerHTML = this.caption;

	//The div that holds the children
	divCH = document.createElement('div');
	divCH.id = 'ch'+this.id;
	divCH.className = myClass;
	

//	str  = '<div id="n'+this.id+'" class="son">';
//	str  = '<span id="p'+this.id+'" class="plus" onclick="'+myPlusOnClick+'">'+myPlus+'</span>';
//	str += '<span id="l'+this.id+'" class="l"'+captionOnClickEvent+'>'+this.caption+'</span>';
//	str += '<div id="ch'+this.id+'" class="'+myClass+'"></div>';

//	div.innerHTML = str;
	divN.appendChild(spanP);
	divN.appendChild(spanL);
	divN.appendChild(divCH);
	

	if (this._parent != null)
	{
		parentChildrenDiv = getObjectById("ch"+this._parent.id);
	}
	else //is root
	{
		parentChildrenDiv = getObjectById("dftree_"+this._myTree.name);
//		append = false;
	}
	
	if (parentChildrenDiv)
	{

		parentChildrenDiv.appendChild(divN);
/*		if (append)
		{
			parentChildrenDiv.innerHTML += str;
		}
		else
		{
			parentChildrenDiv.innerHTML  = str;
		}*/
	}
}

// TREE 
//Usage: t = new dFTree({name:t, caption:'tree root', url:'http://www.w3.org'});
function dFTree(arrayProps) {
	//mandatory fields
	this.name;      //the value of this must be the name of the object

	//optional fields
	this.is_dynamic = true;   //tree is dynamic, i.e. updated on the fly
	this.followCookies = true;//use previous state (o/c) of nodes
	this.useIcons = false;     //use icons or not
	

	//arrayProps[icondir]: Icons Directory
	iconPath = (arrayProps['icondir'] != null)? arrayProps['icondir'] : '';

	this.icons = {
		root        : iconPath+'/foldertree_base.gif',
		folder      : iconPath+'/foldertree_folder.gif',
		folderOpen  : iconPath+'/foldertree_folderopen.gif',
		node        : iconPath+'/foldertree_folder.gif',
		empty       : iconPath+'/foldertree_empty.gif',
		line        : iconPath+'/foldertree_line.gif',
		join        : iconPath+'/foldertree_join.gif',
		joinBottom  : iconPath+'/foldertree_joinbottom.gif',
		plus        : iconPath+'/foldertree_plus.gif',
		plusBottom  : iconPath+'/foldertree_plusbottom.gif',
		minus       : iconPath+'/foldertree_minus.gif',
		minusBottom : iconPath+'/foldertree_minusbottom.gif',
		nlPlus      : iconPath+'/foldertree_nolines_plus.gif',
		nlMinus     : iconPath+'/foldertree_nolines_minus.gif'
	};

	//private
	this._root; //reference to root node
	this._aNodes = [];
	this._lastSelected; //The last selected node
	this._selected; //The actual selected node

	for (i in arrayProps)
	{
		if (i.charAt(0) != '_')
		{
			eval('this.'+i+' = arrayProps[\''+i+'\'];');
		}
	}

}

dFTree.prototype.draw = function() {
	if (!getObjectById("dftree_"+this.name))
	{
		document.write('<div id="dftree_'+this.name+'"></div>');
	}

	if (this._root != null)
	{
		this._root._draw();
		this._drawBranch(this._root._children);
	}

}

//Transforms tree in HTML code. Do not use it. Use draw() instead.
/*dFTree.prototype.toString = function() {
	var str = '';

	if (!getObjectById("dftree_"+this.name))
	{
		str = '<div id="dftree_'+this.name+'"></div>';
	}
	return str;

/ *	if (this.root != false)
	{
		this.root._draw();
		this._drawBranch(this.root.children);
	}* /
}*/

//Recursive function, draws children
dFTree.prototype._drawBranch = function(childrenArray) {
	var a=0;
	for (a;a<childrenArray.length;a++)
	{
		childrenArray[a]._draw();
		this._drawBranch(childrenArray[a]._children);
	}
}

//add into a position
dFTree.prototype.add = function(node,pid) {
	var auxPos;
	var addNode = false;
	if (typeof (auxPos = this._searchNode(node.id)) != "number")
	{
		// if parent exists, add node as its child
		if (typeof (auxPos = this._searchNode(pid)) == "number")
		{
			node._parent = this._aNodes[auxPos];
			this._aNodes[auxPos]._children[this._aNodes[auxPos]._children.length] = node;
			addNode = true;
		}
		else //if parent cannot be found and there is a tree root, ignores node
		{
			if (this._root == null)
			{
				this._root = node;
				addNode = true;
			}
		}
		if (addNode)
		{
			this._aNodes[this._aNodes.length] = node;
			node._myTree = this;
			if (this.is_dynamic)
			{
				node._draw();
			}
		}
	} 

}

//arrayProps: same properties of Node
dFTree.prototype.alter = function(arrayProps) {
	if (arrayProps['id'])
	{
		this.getNodeById(arrayProps['id']).alter(arrayProps);
	}
}

dFTree.prototype.getNodeById = function(nodeid) {
	return this._aNodes[this._searchNode(nodeid)];
}


//Searches for a node in the node array, returning the position of the array 4it
dFTree.prototype._searchNode = function(id) {
	var a=0;
	for (a;a<this._aNodes.length;a++)
	{
		if (this._aNodes[a].id == id)
		{
			return a;
		}
	}
	return false;
}


//Auxiliar functions

//For multi-browser compatibility
function getObjectById(name)
{   
    if (document.getElementById)
    {
        return document.getElementById(name);
    }
    else if (document.all)
    {
        return document.all[name];
    }
    else if (document.layers)
    {
        return document.layers[name];
    }
    return false;
}

// [Cookie] Clears a cookie
function clearCookie(cookieName) {
	var now = new Date();
	var yesterday = new Date(now.getTime() - 1000 * 60 * 60 * 24);
	this.setCookie(cookieName, 'cookieValue', yesterday);
	this.setCookie(cookieName, 'cookieValue', yesterday);
};

// [Cookie] Sets value in a cookie
function setCookie(cookieName, cookieValue, expires, path, domain, secure) {
	document.cookie =
		escape(cookieName) + '=' + escape(cookieValue)
		+ (expires ? '; expires=' + expires.toGMTString() : '')
		+ (path ? '; path=' + path : '')
		+ (domain ? '; domain=' + domain : '')
		+ (secure ? '; secure' : '');
};

// [Cookie] Gets a value from a cookie
function getCookie(cookieName) {
	var cookieValue = '';
	var posName = document.cookie.indexOf(escape(cookieName) + '=');
	if (posName != -1) {
		var posValue = posName + (escape(cookieName) + '=').length;
		var endPos = document.cookie.indexOf(';', posValue);
		if (endPos != -1)
		{
			cookieValue = unescape(document.cookie.substring(posValue, endPos));
		}
		else 
		{
			cookieValue = unescape(document.cookie.substring(posValue));
		}
	}
	return (cookieValue);
};


function imageHTML(src,attributes) {
	if (attributes != null)
	{
		attributes = '';
	}
	return "<img "+attributes+" src=\""+src+"\">";
}
	
