<? if(!defined('IN_DISCUZ')) exit('Access Denied'); ?><?
$__WRAPBG = WRAPBG;$__HIGHLIGHTLINK = HIGHLIGHTLINK;$__SPECIALBORDER = SPECIALBORDER;$__INTERLEAVECOLOR = INTERLEAVECOLOR;$__WRAPBORDER = WRAPBORDER;$__WRAPBORDERCOLOR = WRAPBORDERCOLOR;$__COMMONBORDER = COMMONBORDER;$__TABLETEXT = TABLETEXT;$__COMMONBG = COMMONBG;$return = <<<EOF

<style>
.hslice { margin-bottom: 5px; }
.entry-content, .hslice { background-color: {$__WRAPBG}; }
#homegrids_e { text-align: center; margin-top: 10px; }
#homegrids_e a { color: {$__HIGHLIGHTLINK}; font-weight: 700; }
#homegrid_Img { color: {$__HIGHLIGHTLINK}; }
.entry-content table#homegrids_t { width: 100%; border: 1px solid {$__SPECIALBORDER}; table-layout:fixed; }
.entry-content table#homegrids_t th div.slideouter { border: 0 !important; }
.entry-content #homegrids_t th { width: {$widthA}px; background-color: {$__INTERLEAVECOLOR}; }
.entry-content #homegrids_t td { border: {$__WRAPBORDER} solid {$__WRAPBORDERCOLOR}; }
.entry-content h4 { background-color: {$__INTERLEAVECOLOR}; padding: 5px; text-align: left; }
.entry-content h4 span { cursor: pointer; padding-right: 10px; font-weight: normal; }
.entry-content h4 span.current { font-weight: 700; }
.entry-content ul { background: url('{$boardurl}plugins/homegrids/images/prefix.gif') no-repeat; }
.entry-content li { text-overflow:  ellipsis; overflow: hidden; list-style-image: none; height: 21px; line-height: 21px; text-indent: 20px;  border-bottom: 1px dashed {$__COMMONBORDER}; }
.entry-content li span { float: right; padding-right: 10px; }
.entry-content .textinfolist { text-align: left; }
.entry-title { display: none; }
</style>
<script type="text/javascript">var slideSpeed = 5000, slideImgsize = [{$widthA},{$heightA}], slideBorderColor = '{$__COMMONBORDER}', slideBgColor = '{$__INTERLEAVECOLOR}', slideImgs = new Array(), slideImgLinks = new Array(), slideImgTexts = new Array(), slideSwitchColor = '{$__TABLETEXT}', slideSwitchbgColor = '{$__COMMONBG}', slideSwitchHiColor = '{$__COMMONBORDER}';</script>
<div class="hslice" id="homegrids">
<h2 class="entry-title">{$GLOBALS['bbname']}¶¯Ì¬</h2>
<div class="entry-content">
<table id="homegrids_t" cellspacing="0" cellpadding="0">

EOF;
 if($moduleA) { 
$return .= <<<EOF
<tr><th valign="top"><h4>{$titleA}</h4>{$moduleA}<div id="homegrids_e"><a href="{$boardurl}">½øÈë{$GLOBALS['bbname']}</a></div></th>
EOF;
 } 
$return .= <<<EOF

<td valign="top">
<h4 id="homegrids_t_0" style="display:none">{$navB}</h4>
{$moduleB}
</td>

EOF;
 if($moduleC) { 
$return .= <<<EOF
{$moduleC}
EOF;
 } 
$return .= <<<EOF

</tr>
</table>
</div>
</div>

EOF;
 if($navcount) { 
$return .= <<<EOF

<script type="text/javascript">
switchTab('homegrids', 1, {$navcount});
$('homegrids_t_0').style.display = '';

EOF;
 if($moduleA) { 
$return .= <<<EOF
$('homegrids_e').style.display = 'none';
EOF;
 } 
$return .= <<<EOF

for(i = 1;i <= {$navcount};i++) $('homegrids_t_' + i).style.display = 'none';
</script>

EOF;
 } 
$return .= <<<EOF


EOF;
?>