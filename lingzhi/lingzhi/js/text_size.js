// JavaScript Document

function getCookie(name){
	var sta=document.cookie.indexOf(name+"=");
	var len=sta+name.length+1;
	if((!sta)&&(name!=document.cookie.substring(0,name.length))){
		return null;
	}
	if(sta==-1) return null;
	var end=document.cookie.indexOf(';',len);
	if(end==-1) end=document.cookie.length;
	return unescape(document.cookie.substring(len,end));
}

function setCookie( name, value, expires, path, domain, secure ) {
var today = new Date();
today.setTime( today.getTime() );
if ( expires ) {
expires = expires * 1000 * 60 * 60 * 24;
}
var expires_date = new Date( today.getTime() + (expires) );
document.cookie = name+'='+escape( value ) + ( ( expires ) ? ';expires='+expires_date.toGMTString() : '' ) + //expires.toGMTString() 
( ( path ) ? ';path=' + path : '' ) + ( ( domain ) ? ';domain=' + domain : '' ) + ( ( secure ) ? ';secure' : '' ); 
}

function ID(id){
	return document.getElementById(id);
}
function SetSize(num){
	if(num==null){
		num=14;
	}
	ID('content').style.fontSize=num+'px';
	setCookie('size',num,10000);
}