/*  
Theme Name: Styleicious
Theme URI: http://www.thaslayer.com/
Description: Great looking web 2.0 wordpress template with ajax addons.
Author: ThaSlayer
Author URI: http://www.thaslayer.com/
*/

window.onload=function()
	{
	
	if(initAjaxEngine('rbet_engine',rbet_engine)&&!uses_mod_rewrite)
		{
		registerLinks(document);
		}
	}
	
var debug=false;
var rbet_session=ie_times=0;

function registerLinks(item)
	{
	
	if(!uses_mod_rewrite)
		{var a=item.getElementsByTagName('a');
		var c=a.length;
		
		//rlra(a[0]);
		
		for(var i=0;i<c;i++)
			rlra(a[i]);
		}
	var a=item.getElementsByTagName('form');
	var c=a.length;
	for(var i=0;i<c;i++)
		rfra(a[i]);
	}

function rfra(item)
	{
	if(item.method=='get')
		{if(!uses_mod_rewrite)
			{var t=document.createElement('input');
			t.type='hidden';
			t.name='in_element';
			t.value='content_c';
			item.appendChild(t);
			item.onsubmit=function()
				{
				loadingShow('content_c');
				item.action=rbet_engine['f'];
				}
			item.target=rbet_engine['n'];
			}
		}
	else
		{var error=false;
		if(!$('loged_in'))
			{
			item.onsubmit=function()
				{
				var author=$('author');
				var email=$('email');
				var txt=$('comment');
				var website=$('url');
				
				if(website&&website.value=='Website Address (Optional)')
					website.value='';
				
				if(!author||!email||!txt)
					{
					alert('All required fields must be field out');
					return false;
					}
				else
					if(!(author.value.length)||!(email.value.length)||!(txt.value.length))
						{
						alert('All required fields must be field out');
						return false;
						}
					else
						{var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
						if (!filter.test(email.value))
							{alert('Not a valid email address!');
							return false;
							}
						else
							{
							loadingShow('content_c');
							return true;
							}
						}
				return false;
				}
			}
		else		
			{item.onsubmit=function()
				{
				loadingShow('content_c');
				}
			}
		if(!error)
			{if(item.action.indexOf('?')!=-1)
				item.action+='&in_element=content_c';
			else
				item.action+='?&in_element=content_c';
						
			var t=document.createElement('input');
			t.type='hidden';
			t.name='redirect_to';
			t.value=rbet_engine['f'];
			var x;
			if(x=document.getElementsByName('comment_post_ID').item(0))
				{
				t.value=rbet_engine['f']+'?in_element=content_c&p='+x.value;
				}
			item.appendChild(t);
			}
		else
			return false;
		item.target=rbet_engine['n'];
		}
	
	
	}
	
function rlra(item)
	{
	var link;
	var query;
	var c;
	var script='index.php';
	
	link=item.href.split('/');
	c=link.length-1;
	query=link[c].split('?');
	
	if(query[0].indexOf('.')==-1)
		{link[c]=query[0];
		link=link.join('/');
		}
	else
		{link.pop();
		script=query[0];
		link=link.join('/');
		}
	
	if(query.length!=1)
		{query.shift();
		item.queryString=query.join('?');
		}
	else
		item.queryString='';
	
	//alert(query);
	if(String(query).indexOf('feed=')!=-1)
		script='feed';
		
	if(script=='index.php'&&(link==wp_url||link==wp_url+'/'||link+'/'==wp_url||link+'/'==wp_url+'/'))
		{item.onclick=function(event)
			{rbetAjax('content_c',this.queryString);
			event=event||window.event;
			event.returnValue=false; 
			return false;
			}
		}
	}

function $(w){return document.getElementById(w);}
function getQueryStringFromUrl(url)
	{if(url)
		{url=(String(url).replace(/&amp;/,'&')).split('&');
		var re=new Array;
		var c=url.length;
		var index;
		for(var i=0;i<c;i++)
			{url[i]=url[i].split('=');
			index=url[i].shift();
			re[index]=url[i].join('=');
			}
		return re;
		}
	}
	
	
function initAjaxEngine(id,file)
	{id=id||'engine';
	file=file||'engine.php';
	if(debug)
		document.body.innerHTML+='<iframe id="'+id+'" name="'+id+'" frameborder="0" height="300" width="100%" marginheight="0" marginwidth="0"  scrolling="yes" src="'+file+'" style="background:#FFF"></iframe>';
	else
		document.body.innerHTML+='<iframe id="'+id+'" name="'+id+'" frameborder="0" height="0" width="0" marginheight="0" marginwidth="0"  scrolling="no" src="'+file+'" style="visibility:hidden"></iframe>';
	rbet_engine=new Array;
	rbet_engine['f']=file;
	rbet_engine['n']=id;
	return rbet_engine['i']=$(id);
	}
	
	
function rbetAjax(inElement,q)
	{if(!rbet_session&&typeof(rbet_engine)=='object')
		{rbet_session=1;
		
		loadingShow(inElement);
		var query=rbet_engine['f']+"?in_element="+inElement;
		if(String(q)&&String(q).indexOf('#')!=-1)
			{q=String(q).split('#');
			query+="&"+q.shift()+'&goto_html_a='+q.join('#');
			}
		else
			query+="&"+q;
		
		//alert(query);
		ie_times++;
		rbet_engine['i'].src=query+"&"+ie_times;
				
		}
	return false;
	}

function loadingShow(w)
	{
	if(w&&(w=$(w)))
		{
		alpha_elem(w,55);
		var div=document.createElement('div');
		div.className="loading";
		div.innerHTML='<img src="'+wp_theme_adr+'/images/loading.gif" alt="" />'
		var scrollTop = window.pageYOffset || document.documentElement.scrollTop || 0; 
		div.style.top=w.offsetTop+scrollTop+100+'px';
	
		w.appendChild(div);
		}
	}
function alpha_elem(item,alpha)
	{if (item)
		{item.style.opacity=alpha/100;
		item.style.MozOpacity=alpha/100;
		item.style.filter="progid:DXImageTransform.Microsoft.Alpha(opacity="+alpha+")";
		item.style.filter="alpha(opacity="+alpha+")";
		}
	}
	
function ch_bg_in(item,h)
	{
	if(item)
		if(h)
			item.style.backgroundColor='#EEFAFC';
		else
			item.style.backgroundColor='#FFF';
	}
function cb(item,w)
	{
	if(item)
		{
		item.style.background="url("+w+")";
		}
	}