<? if(!defined('IN_DISCUZ')) exit('Access Denied'); function tpl_relatetag($tagdata, $name, $ext, $i) {
 ?><?
$return = <<<EOF


EOF;
 if($tagdata) { 
$return .= <<<EOF

<div
EOF;
 if($i == 2) { 
$return .= <<<EOF
 class="noborder"
EOF;
 } 
$return .= <<<EOF
>
<h4>{$name}</h4>

EOF;
 if(!$ext) { 
$return .= <<<EOF

<ul>
{$tagdata}
</ul>

EOF;
 } else { 
$return .= <<<EOF

<dl>
<dt>
{$ext}
</dt>
<dd>
<ul>
{$tagdata}
</ul>
</dd>

EOF;
 } 
$return .= <<<EOF

</div>

EOF;
 } 
$return .= <<<EOF


EOF;
?><? return $return; }

function tpl_relatetagwrap($data) {
 ?><?
$return = <<<EOF


EOF;
 if($data) { 
$return .= <<<EOF

<div class="taglinks">
{$data}
</div>

EOF;
 } 
$return .= <<<EOF


EOF;
?><? return $return; }
 ?>