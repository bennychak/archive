<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="all" name="robots">
<meta name="author" content="amay@amay-jewelry.com,Amay">
<meta name="Copyright" content="AMAY JEWELRY">
<title>AMAY JEWELRY</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script language="javascript">
function SelectMenu(item_id)
{	
	var item_sub;
	var item_menu_left;
	for(i = 1; i <= 7; i++){
		item_sub = document.getElementById("page_"+i);
		item_sub.style.display="none";
		item_menu_left = document.getElementById("menu_left_"+i);
		item_menu_left.className="menu_off_left"
	}
	
	document.getElementById("menu_left_"+item_id).className="menu_on_left";
	document.getElementById("page_"+item_id).style.display="";
}
</script>
</head>
<body>
<!--#include file="head.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="page_toper">
  <tr>
    <td><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="250" align="center"><img src="images/faq_title.gif" width="220" height="52"></td>
          <td class="limap"><!--#include file="link_bar.asp"--></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="100" align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
                <td width="10">&nbsp;</td>
                <td><table cellspacing=0 cellpadding=0 width=172 background="images/bg_leftmenu01.gif" border=0>
                    <tr>
                      <td width=6 height=22 id="menu_left_7" class="menu_on_left"></td>
                      <td style="padding-left: 15px; cursor:pointer" width="166" onClick="SelectMenu(7)" id="menu_7">Brief introduction of the rosewood</td>
                    </tr>
                    <tr>
                      <td height="1"></td>
                      <td bgcolor="#bdbdbd"></td>
                    </tr>
                  </table></td>
              </tr> 
			  		  
			<tr>
                <td width="10">&nbsp;</td>
                <td><table cellspacing=0 cellpadding=0 width=172 background="images/bg_leftmenu01.gif" border=0>
                    <tr>
                      <td width=6 height=22 id="menu_left_6"></td>
                      <td style="padding-left: 15px; cursor:pointer" width="166" onClick="SelectMenu(6)" id="menu_6">How about order</td>
                    </tr>
                    <tr>
                      <td height="1"></td>
                      <td bgcolor="#bdbdbd"></td>
                    </tr>
                  </table></td>
              </tr>              
			  <tr>
                <td width="10">&nbsp;</td>
                <td><table cellspacing=0 cellpadding=0 width=172 background="images/bg_leftmenu01.gif" border=0>
                    <tr>
                      <td width=6 height=22 id="menu_left_1"></td>
                      <td style="padding-left: 15px; cursor:pointer" width="166" onClick="SelectMenu(1)" id="menu_1">Why choose magnets</td>
                    </tr>
                    <tr>
                      <td height="1"></td>
                      <td bgcolor="#bdbdbd"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td width="10">&nbsp;</td>
                <td><table cellspacing=0 cellpadding=0 width=172 background="images/bg_leftmenu01.gif" border=0>
                    <tr>
                      <td width=6 height=22 id="menu_left_2"></td>
                      <td style="padding-left: 15px; cursor:pointer" width="166" onClick="SelectMenu(2)" id="menu_2">Why choose titanium</td>
                    </tr>
                    <tr>
                      <td height="1"></td>
                      <td bgcolor="#bdbdbd"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td width="10">&nbsp;</td>
                <td><table cellspacing=0 cellpadding=0 width=172 background="images/bg_leftmenu01.gif" border=0>
                    <tr>
                      <td width=6 height=22 id="menu_left_3"></td>
                      <td style="padding-left: 15px; cursor:pointer" width="166" onClick="SelectMenu(3)" id="menu_3">Why choose pearl jewelry</td>
                    </tr>
                    <tr>
                      <td height="1"></td>
                      <td bgcolor="#bdbdbd"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td width="10">&nbsp;</td>
                <td><table cellspacing=0 cellpadding=0 width=172 background="images/bg_leftmenu01.gif" border=0>
                    <tr>
                      <td width=6 height=22 id="menu_left_4"></td>
                      <td style="padding-left: 15px; cursor:pointer" width="166" onClick="SelectMenu(4)" id="menu_4">Why choose germanium</td>
                    </tr>
                    <tr>
                      <td height="1"></td>
                      <td bgcolor="#bdbdbd"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td width="10">&nbsp;</td>
                <td><table cellspacing=0 cellpadding=0 width=172 background="images/bg_leftmenu01.gif" border=0>
                    <tr>
                      <td width=6 height=22 id="menu_left_5"></td>
                      <td style="padding-left: 15px; cursor:pointer" width="166" onClick="SelectMenu(5)" id="menu_5">Why choose stainless steel </td>
                    </tr>
                    <tr>
                      <td height="1"></td>
                      <td bgcolor="#bdbdbd"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr bgcolor="#bdbdbd">
                <td height="1" colspan="2"></td>
              </tr>
              <tr bgcolor="#efefef">
                <td height="8" colspan="2"></td>
              </tr>
            </table></td>
          <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="100" align="center" valign="top" style="padding:10px 20px 0 20px ">
				  <table width="100%" border="0" cellpadding="2" cellspacing="2" id="page_7">
                    <tr>
                      <td height="30" class="why_choose_title">Brief introduction of the rosewood.</td>
                    </tr>
                    <tr>
                      <td><p class="why_choose_title_sub">&nbsp;</p>
                          <div style="float:right "><img src="images/why_choose/wood.jpg" width="429" height="273" ></div>
                        <p>    The Rosewood, a kind of the rarest and the most priceless timber in the world,produces in the tropical rain forest of the Nanyang Archipelago,with one produced in India the most precious. It grows very slowly and needs one thousand years to grow up.During such a long years, the cells in the middle of the trunk would die gradually as the accumulated water for many years. As a result,the intermediate part of the rosewood would turn putried and form empty hole. So there is a saying as “Ten rosewood,nine empty: one inch rosewood, one inch gold”,and the rate of producing timber is less than 20%.however , its abundant growth makes the quality more compact, the specific gravity larger and the hardness stronger. It weighs extremely and sinks to the water rapidly. Its veins are slender and floating with endless change. Especially, its tone is deep,showing steady,graceful and beautiful. It is the king in the kings and is very hard to obtain.</p>
                        <p> Only the imperial family in china could use it in the past.The rosewood is rare,but according to the record in the book &lt;&lt;Ben Cao Gang Mu&gt;&gt; written by Li Shizhen in the Ming Dynasty,the rosewood can stop bleeding , stop pain, apply knife wound, remove swelling, adjust blood and maintain appearance, and can also cure heart heat, blood disease, joint swelling, depression and breath difficulty. It is a rare medicinal material and has pleasant fragrance and various colors.it is also called Holy Rosewood thanks to its avoiding evil. So people often regard it as auspicious matter to ensure safety forever.</p>
						<p>  At  present  we combined  this  precious wood  series  with  316L  stainless steel  and  titanium material ,developed out  various and top grade bracelets,rings ,pendants ,necklaces,etc fashion   jewellery  ,besides,they  are  good  for  health  care. Due to unique designs ,fine  works, they seems simple , exalted, fashion and elegancy,and  can  express the individual personality.  Plus the  health  protection  of this  rosewood, our  products are  suitable  to   the  old  and  young.</p>
						<p>&nbsp;</p>
                      </tr>
                  </table>
				  <table width="100%" border="0" cellpadding="2" cellspacing="2" id="page_6" style="display:none">
                    <tr>
                      <td height="30" class="why_choose_title">How about order</td>
                    </tr>
                    <tr>
                      <td>
<p class="why_choose_title_sub">do you make customers design?</p>
<div style="float:right "><img src="images/why_choose/use7.jpg" ></div>
<p>Yes, OEM also welcome, We do custom er's design also.First of all, please provide your pictures or works drawing picture with size Details and necessary explaining.Also do not forget let us knowthe quantities you will order.We will study your pictures and then let you know if we can make it or not and offer you our price within one week .if you can provide living sample,it will be much easy for us to processing.</p>

<p class="why_choose_title_sub">How to place and order?</p>

<p>if you need to place an order,first of all, e-mail or fax us your order from with products code and quantities and description of finishing you like and other conditions.We will send you our Performa invoice let you confirm all conditions(as payment terms,delivery terms,time of delivery,packing and products descriptions etc.) and terms we agree each other.And the Performa invoice need your sign back.After received the document we mentioned in our contract or PI.then may start to produce your order.The order lead time usually take 30 to 40days.</p>
<p class="why_choose_title_sub">Do you have mini order quantity?</p>

<p>Yes. Since we are manufactures,and we need quantities to control our production cost and speed.So we have mini order request.Usually our mini order for stainless steel and titanium braelet is 200pcs,pendent 100pcs,ring 50pcs each size for each item,necklace 200pcs,cufflinks 200 pairs.Please note, our catalogues price usually not for mini order quantities.</p>

<p class="why_choose_title_sub">How to get the sample and catalogues?</p>

<p>if you are first time to contact with Amay Jewelry Company,please kindly provide us details information about your company.We need your details of your contact people,company name,address,phone number,fax number and e-mail address.Please sure all of these information are clear and correct, Otherwise,you may not received our feedback and can not received our catalogues in right time.If you can provide us your carrier account number ad DHL,UPS,FEDEX,we would be glade to provide some free sample for you also.</p>

<p class="why_choose_title_sub">How you delivery and shipping the goods?</p>

<p>Usually we shipping the goods as our client request.And our delivery condition is FOB ShenZhen,China.Some of the client have forwarder in china,we can send the order goods to your forwarder in China.If you Have no agent or forwarder in china, you also can choose the carrier or air shipping and we will try to get best discount for you,and you should be prepaid the fright and insurance charge.</p>
<p class="why_choose_title_sub">How we packing the goods?</p>

<p>Usually our packing condition is inner box and carton.Repacked.And inner box will pack 50 to 100ps of our products.There have 4 to 6 inner boxes packed in one carton.All packing are not more than 20kg and safe.If you need us to provide special gift or jewelry boxes,you can ask us to purchase or you provide your own packing boxes to us in advance. </p>
<p class="why_choose_title_sub">Dose the price different for different quantities?</p>

<p>yes.Because different quantities make the production const different.So the price will different.Also different quantity make the const different too.</p>
<p class="why_choose_title_sub">What kind of stainless steel and titanium you use?</p>

<p>We only use 316L stainless steel in our products.Since only the 316L stainless steel is nickel free and best quality.
And use TA2 titanium in our products.</p>
<p class="why_choose_title_sub">What kind of plating you use for the stainless steel and titanium?</p>

<p>Since the stainless steel and titanium are silver metal color it self.So after polished finishing,it will be not plated The silver color.We only use IPG or IPB plating on the stainless steel and titanium products for gold color and black color.Since the IP plating can be last more than one year on stainless steel and titanium Other Plating will fade fast on titanium and stainless steel.If you use it in right way,it can be last more than 2 years.</p>
<p class="why_choose_title_sub">What kind of CZ you use?</p>

<p>We use AAA grade CZ on our products,but you also can choose the other brand or quality of CZ.Also you can use crystal,the quality is better than the CZ. </p>
<p class="why_choose_title_sub">How you put stone on the stainless steel and titanium part?</p>

<p>For most of our products,we hand pressure setting.The pressure setting can prevent from the stone come out of the metal part and it is much safe and good looking than that of the glue way.We also have CNC claw setting but these way is much expensive than the pressure setting.Some of the products we use clip setting and this way of setting stone should be prevent from falling the products on the floor.Because it is not as strong as pressure setting.Some of the products consider of the cost,we may use glue.We have the inform in our products list and we will inform our client when they order.For the semi stones,since the hardness is not strong enough,we use fine quality AB glue. </p>
<p class="why_choose_title_sub">Does the length of the titanium and stainless steel bracelet and necklace can be adjustable?</p>

<p>Yes,most of our linked bracelet and necklace are adjustable like the watch bracelet.We also can provide you some small tools to make adjustment.But the tool will be charge to you.</p>
<p class="why_choose_title_sub">What is the size of stainless steel and titanium ring are available?</p>

<p>The ring size we can make from US size #5 to # 14. The woman's size usually from #5 to #9,and man's size usually from #8 to #13.And the price will have little higher for size above #9.</p>
                    </tr>
                  </table>				
				<table width="100%" border="0" cellpadding="2" cellspacing="2" id="page_1" style="display:none">
                    <tr>
                      <td height="30" class="why_choose_title">Why choose magnets</td>
                    </tr>
                    <tr>
                      <td><p class="why_choose_title_sub">How do I use the magnets?</p>
                        <div style="float:right "><img src="images/why_choose/magnet.gif" width="207" height="100"></div>
                        <p>Using magnets is no secret. They are extremely simple to use. Just place the magnet on or near the area where you want to receive comfort. It is not necessary to keep the magnet on the area continuously. Magnets should not be used on an open and fresh wound. </p>
                        <p class="why_choose_title_sub">What Is The Difference between North and South Poles?</p>
                        <p>The North and South poles are magnetic opposites. Scientists call these geophysical magnetic lines - from north to south, with the North being the Negative and the South being the Positive. </p>
                        <img src="images/why_choose/Coils.gif" width="353" height="174">
                        <p class="why_choose_title_sub">How Do Magnets Work to Comfort Painful conditions?</p>
                        <p>A painful area almost always lacks blood circulation and oxygen. The area usually is highly acidic and has a positive polarity. The negative (Unipole) magnet increases the circulation, thus bringing more oxygen to the painful area, reducing inflammation. The negative energy field produced by the magnet also counteracts the positive field associated with the painful condition. </p>
                        <p class="why_choose_title_sub">Does it make a Difference on which wrist you wear Magnetic Bracelets?</p>
                        <p>Therapeutic Magnetic bracelets utilize reflexology points on the wrist. As we are individuals, the best way to judge is to wear a bracelet on one wrist for a certain time period to see if it will help with your unique situation. Switching wrists to obtain different results for your problem is recommended by some sources. (It is not recommended that any jewelry be worn in a shower or while doing dishes to prevent soap scum build-up between links.) </p>
                        <p class="why_choose_title_sub">Who Are Using Magnets?</p>
                        <p>Several celebrated sports figures also provide authenticated testimony to the personal benefits they've personally experienced with exclusive use of Therapy Ma </p></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellpadding="2" cellspacing="2" id="page_2" style="display:none">
                    <tr>
                      <td height="30"><p class="why_choose_title">Why choose titanium</p></td>
                    </tr>
                    <tr>
                      <td>
<p class="why_choose_title_sub">What is Titanium?</p>

Titanium is a natural element which has a silver-greyish-white colour.The density of titanium is 4.51g/cm 3,it is the hardest natural metal in the world.It is very stong.three times the strength of steel and much stronger than gold silver and platinum and yet is very light weight.Pure titanium is also 100% hypoallergenic which means that it if safe for anyone to wear as it will not react to your skin.
<p class="why_choose_title_sub">Why choose titanium?</p>
<div style="float:right "><img src="images/why_choose/25190143.jpg" width="350" height="194"></div>
<p>Titanium provides several unique factors that make it the ideal metal for jewellery rings.It is very strong,more dent,bend and scratch resistant than gold,silver and platinum,is light weight and importantly offers and exotic array of colours which other metals simply do not. We can colour our titanium in blue,purple and iridescent colours.Our titanium is also 100% hypoallergenic and will not produce skin irritation or discolouration. pure titanium is 100% hypoallergenic and allergy free and will not produce skin irritation or discoloration.Pure titanium does not react to sunlight,salt water or anything that the body emits.This is why we only offer pure titanium to our clients.We use pure titanium with confidence knowing that everyone can wear it without the concern of an adverse reaction to your body.
<p class="why_choose_title_sub">What grade of titanium do we use?</p>

<p>We use 99.76% pure commercial grade titanium.Our titanium is pure and of surgical implant quality which means that it is hypoallergenic and allergy free
<p class="why_choose_title_sub">How is titanium coloured?</p>

<p>The colour of our titanium jewelry is not a paint, plate or pigment(gold colour not inculded). The colour in our titanium product is caused by oxidisation.Titanium is a type of refractory metal that has an intersting relationship with oxygen.Oxygen causes a structural change in the metal's surface crystals creating an oxide. the oxide is as hypoallergenic as titanium,but has a unique light refractory property that causes the titanium to appear in various colours to the human eye.The oxidisaftion is produced by a heating process that causes the titanium to change colour.The colour will not fade or chip thought it can be scratched off.The titanium in not coloured through the entire depth of the metal.Although titanium is a very strong metal,as with any metal it can,and will scratch, and scratching,the titanium colour can be removed.
<p class="why_choose_title_sub">Can titanium be engraved?</p>

<p>Yes,we can engrave your special message on the inside of your titanium jewelry.To make your titanium products truly yours we can engrave your special mark for only $0.5 additonal.If you would like us to engrave your products for own brand,please place your order for your titanium ring through your order.
<p class="why_choose_title_sub">Can titanium rings and bracelet be resized?</p>

<p>Titanium rings are very strong,which makes them difficult to resize,We can normally resize titanium rings by a small amount up, however cannot resize them down.Regarding the titanium bracelet,you may adjust the size by remove some links. </p>
<p class="why_choose_title_sub">Can you make gold and titanium rings?</p>

<p>Yes,we provide titanium and gold rings,You can choose from white gold or yellow gold and natural coloured titanium or coloured titanium.The gold and titanium colour combinations look fantastic and are very distincfive.The titanium and gold styles are available in with gold edges or with gold inlay stripes or gold plated.You can also choose our great new silver and titanium style. </p>
<p class="why_choose_title_sub">Can i have satin finished titanium jewelry?</p>

<p>Yes,you can choose from 3types of satin finishes and our 'meteor' heavy texture style.The satin finishes are available in a light,medium and heavy texture for both our natural coloured titanium rings and coloured titanium rings,Although titanium is very strong, much stronger than gold,platinum and silver and is more bend,dent and scratch resistant,titanium will still scratch depending upon its wear and use.You can choose a satin finish for your titanium ring to help keep it looking good for longer.We recommend that a satin finish be selected for the coloured titanium rings.The meteor style uses deep grooves in the titanium.The coloured meteor rings have lighter and darker sedtions(light and dark blue) and are polished on the top edge of the grooves to give a great finish.</p>
<p class="why_choose_title_sub">How to cleaning titanium?</p>

<p>Simply use a soft cloth and warm soapy water to clean your titanium jewelry.Do not use strong detergent or chemicals and never use toothpaste to clean your jewellery.For polished natural colour titanium jewelry.We suggest that you have your titanium jewelry polished about one or twice a year.This will help to keep the jewelry looking great.
Other designs</p>

<p>Titanium is difficult to work with,not manipulated easily,cannot be welded or soldered and takes a heavy toll on jewellery machine tools, For this reason, at this stage we are not able to offer styles other than those displayed on our web site or our offer.
<p class="why_choose_title_sub">Does the colour fade or wear - How to care for your titanium jewelry and coloured titanium jewelry?</p>

<p>Although titanium is a very strong metal,much stronger than gold,platinum and silver, and is more scratch,bend and dent resistant, it is not completely scratch resistant.As with any jewellery,titanium jewelry will scratch,Scratching of any metal,including titanium can happen with one day or one year-there is not a certain time from when scracthing and wear will begin to occur.To help keep your jewelry kooking good.we suggest that you not wear your jewelry whilst gardening,whilst working with abrasive substances,at the gym,playing sport or at the beach As with gold rings, polished titanium rings can easily be polished by a local jeweller for only a fwe dollars to make the ring look like new again.Remember,the more respect you have for your jewellery,the longer it will stay looking good for you,You do need to appreciate how ever that titanium jewelery,as with gold , can and will scratch with normal wvery day wear and not just with heavywear.</p>
<p>To help with looking after your coloured titanium jewelry,we highly recommend that you choose a heavy satin finish for the titanium colour,particularly if you will be wearing a coloured titanium jewelry as your wedding ring or for every day wear.Satinfinish helps to protect the colour on the titanium jewelry.</p>
<p>You can also choose a style where the coloured titanium is more protected ina grooved section of the jewelry.This will help to protect the coloured titanium.If you are concerned about the wear of your titanium jewelry or are choosing coloured titanium wedding rings,we suggest that you choose the heavy satin finish,a meteor ring finish or a grooved</p>

                    </tr>
                  </table>
                  <table width="100%" border="0" cellpadding="2" cellspacing="2" id="page_3" style="display:none ">
                    <tr>
                      <td height="30" class="why_choose_title">Why choose pearl jewelry</td>
                    </tr>
                    <tr>
                      <td><p>In this guide, you'll learn to recognize quality and understand value when choosing the type of pearl that's right for you. In every 10,000 oysters, you might be lucky enough to find a single natural pearl. Because of this scarcity, most pearls today are cultured pearls. A tiny bead is implanted in an oyster, so that it is gradually coated in layers of a beautiful, pearlescent substance called nacre which build up to create a lustrous pearl. </p>
                        <p class="why_choose_title_sub">Color</p>
                        <div style="float:right "><img src="images/why_choose/diag_pearlcolor_285x130.gif" width="285" height="130"></div>
                        <p>The general color of a pearl is also called the body color. Typical pearl colors are white, cream, yellow, pink, silver, or black. A pearl can also have a hint of secondary color, or overtone, which is seen when light reflects off the pearl surface. For example, a pearl strand may appear white, but when examined more closely, a pink overtone may become apparent.</p>
                        <p class="why_choose_title_sub">Luster</p>
                        <p>Pearls produce an intense, deep shine called luster. This effect is created when light reflects off the many layers of tiny calcium carbonate crystals that compose the pearl. This substance is called nacre. When selecting a pearl, consider that the larger the pearl, the more nacre it has, so it will also exhibit even more luster. Compare a 5mm Freshwater cultured pearl with a 10mm South Sea cultured pearl and the difference in the amount of nacre is obvious. The difference in luster is as clearly visible as the difference in the pearl sizes.</p>
                        <p class="why_choose_title_sub">Shape</p>
                        <div style="float:right "><img src="images/why_choose/diag_pearlshape_285x130.gif" width="285" height="130"></div>
                        <p>At Blue Nile, we offer the highest quality, rarest pearl shape – round. Shapes that are not spherical or even symmetrical are considered lower quality. Akoya, Tahitian, and South Sea pearls found in jewelery have a tendency to be the roundest, while Freshwater pearls can be oval or slightly off-round.</p>
                        <p class="why_choose_title_sub">Surface marking</p>
                        <p>As an oyster creates a pearl, the layers of nacre do not always adhere smoothly. Sometimes spots and bubbles can appear in the layering process. Pearls with the smoothest surfaces are the highest-quality, most sought-after pearls. At Blue Nile, to offer you a range of prices, we offer pearls with a range of surface qualities.</p>
                        <p class="why_choose_title_sub">Size</p>
                        <div style="float:right "><img src="images/why_choose/diag_pearlsize_285x130.gif" width="285" height="130"></div>
                        <p>The size of the pearl greatly depends on the type of pearl. Freshwater pearls range in size from about 3.0?.0mm, Akoya pearls range from about 6.0?.5mm, and South Sea and Tahitian pearls can reach sizes as large as 13mm. choose the right pearl:</p>
                        <p>Now, read on to learn the differences between the different types of pearls, and learn the levels of quality you can expect from each type. </p></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="2" cellpadding="2" id="page_4" style="display:none">
                    <tr>
                      <td height="30"><a href="#" class="why_choose_title">Why choose germanium</a></td>
                    </tr>
                    <tr>
                      <td>
					    <div style="float:right "><img src="images/why_choose/ger_2.jpg" width="200" height="155"></div>
						<p>germanium [from Germany], semimetallic chemical element; symbol Ge; at. no. 32; at. wt. 72.59; m.p. 937.4°C; b.p. 2,830°C; sp. gr. 5.323 at 25°C; valence +2 or +4. Pure germanium is a lustrous, gray-white, brittle metalloid with a diamondlike crystalline structure. It is similar in chemical and physical properties to silicon, below which it appears in group IVa of the periodic table. Germanium is very important as a semiconductor.</p>
						
                        <p>Germanium oxide is added to glass to increase the index of refraction; such glass is used in wide-angle lenses. Since the oxide is transparent to infrared radiation, it has found use in optical instruments. Germanium tetrachloride is a liquid that boils at 84°C; it is an intermediate in the production of pure germanium. Other halides are known. Germane (germanium tetrahydride) is a gas that decomposes at about 300°C to hydrogen and germanium; it is sometimes used in the production of semiconductor devices. A sulfide and numerous organo-germanium compounds are known. Germanium occurs in a few minerals, e.g., argyrodite (with silver and sulfur), zinc blende (with zinc and sulfur), and tantalite (with iron, manganese, and columbium). </p>						
                        <img src="images/why_choose/ger_1.jpg" width="288" height="150">
                        <p>The chief ore of germanium is germanite, which contains copper, sulfur, about 7% germanium, and 20 other elements. Germanium is produced as a byproduct of the refining of other metals; there is considerable recovery from flue dusts and from ashes of certain coals with high germanium content. The element was called ekasilicon by D. I. Mendeleev, who predicted its properties with striking accuracy from its position in his periodic table. It was first isolated from argyrodite in 1886 by Clemens Winkler, a German chemist, who gave it the name germanium.</p>
                        
						
						<p>Dr. Asai found that Ge-Oxy 132 occurs in high concentrations in medicinal plants, and is therefore one of the main active principles responsible for the therapeutic action of many age old, natural remedies. He did not regard is as a drug. He stated, &quot;I would rather call it a health-giving substance - it restores health to those afflicted with disease and sustains health in those who are healthy.... Where body cells lack oxygen, indispensable to life, a gradual decline in function is inevitable and the fire of life will reduce until it is extinguished&quot; *. </p></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="2" cellpadding="2" id="page_5" style="display:none ">
                    <tr>
                      <td height="30"><p class="why_choose_title">Why choose Stainless steel </p></td>
                    </tr>
                    <tr>
                      <td><p>Stainless Steel is essentially a low carbon steel to which chromium has been added. It is this addition of chromium, in amounts greater than 12%, that gives the steel its unique 'stainless', corrosion resisting properties. </p>
                        <p>The chromium content of the steel allows the formation of a tough, adherent, invisible, corrosion resisting chromium oxide film on the steel surface. If damaged mechanically or chemically this film is self healing, provided that oxygen, even in very small amounts, is present. The corrosion resistance, as well as other useful properties of the steel is enhanced by increased chromium content and the addition of other elements such as molybdenum, nickel and nitrogen.</p>
                        <p class="why_choose_title_sub"> Stainless Steel's healing characteristics </p>
                        <p><img src="images/why_choose/image013.png" width="225" height="126"></p>
                        <p>Benefits of Stainless Steel</p>
                        <p class="why_choose_title_sub"> Long Term Value</p>
                        <p>When the total life cycle costs are considered, stainless steel is often the least expensive option</p>
                        <p class="why_choose_title_sub"> Low Maintenance Costs</p>
                        <p> Stainless Steel normally only requires a periodic wash using a dilute solution of household detergent and water. Surfaces should be washed with a soft sponge and water.</p>
                        <p class="why_choose_title_sub"> Ease of Fabrication </p>
                        <p>Modern steel manipulation techniques mean that stainless steels can be cut, welded, formed and fabricated as readily as traditional steels and other materials. </p>
                        <p class="why_choose_title_sub">Corrosion Resistance</p>
                        <p> Lower alloy grades resist corrosion in normal atmospheric and potable water environments, while the more highly alloyed grades can resist corrosion in many acids and alkaline solutions, and some chloride bearing environments, properties which are widely in process plants. </p>
                        <p class="why_choose_title_sub">Strength </p>
                        <p>The mechanical properties of stainless steels allow thinner sections to be used than with other materials, thus reducing weight without compromising strength. Austenitic grades work harden with cold working and duplex steels allow for reduced thicknesses over traditional grades. Substantial cost savings therefore result as well as increased competitiveness with alternative materials.</p>
                        <p class="why_choose_title_sub"> Hygiene </p>
                        <p>Internationally recognised as by far the most hygienic surface for the preparation of foods. The unique surface of stainless steel has no pores or cracks to habour dirt, grime or bacteria. This cleansability far exceeds other surfaces makes it the first choice for strict hygienic conditions, such as hospitals, commercial kitchens, abattoirs and other food and beverage processing plants. </p>
                        <p class="why_choose_title_sub">Aesthetic Appearance </p>
                        <p>The bright, easily maintained surface of stainless steel provides an attractive and contemporary appearance, ideal for a wide and growing range of applications </p></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="footer.asp"-->
</body>
</html>
