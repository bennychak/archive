<? if(!defined('IN_DISCUZ')) exit('Access Denied'); hookscriptoutput('relatekw');?><? include template('header', '0', ''); if($return) { ?>
<script type="text/javascript">
var tagsplit = $('tags').value.split(' ');
var inssplit = "<?=$return?>";
var returnsplit = inssplit.split(' ');
var result = '';
for(i in tagsplit) {
for(j in returnsplit) {
if(tagsplit[i] == returnsplit[j]) {
tagsplit[i] = '';break;
}
}
}
for(i in tagsplit) {
if(tagsplit[i] != '') {
result += tagsplit[i] + ' ';
}
}
$('tags').value = result + "<?=$return?>";
</script>
<? } include template('footer', '0', ''); ?>