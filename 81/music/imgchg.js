<!--
//
// �� ���ж�̬��ťͼ�ļ����л�����
// 
toggleKey = new Object();
toggleKey[0] = "_off";
toggleKey[1] = "_on";
toggleKey[2] = "_ovr";
toggleKey[3] = "_out";
toggleKey[4] = "_mdn";
toggleKey[5] = "_mup";
function imgChange(id,act){
if(document.images){ document.images[id].src = eval("img." + id + toggleKey[act] + ".src");}
}
// ����γ������Ӧ�õ�������ʹ��ʱ��(exobud.js)
// �Ժ�ʽ imgChange('��ťʶ������',0) ���еĶ�����ʹ�� "off" ��ͼ����
// �Ժ�ʽ imgChange('��ťʶ������',1) ���еĶ�����ʹ�� "on" ��ͼ����
if(document.images){
img = new Object();
// ��ʾ����״̬�� Scope ��̬ͼ�ļ� (��ֹ��ת��)
img.scope_off = new Image();
img.scope_off.src = "./img/scope_off.gif";
img.scope_on = new Image();
img.scope_on.src = "./img/scope_on.gif";
}
//-->

