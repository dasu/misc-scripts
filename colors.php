<?php
$ip=getenv("REMOTE_ADDR");
$hostname=gethostbyaddr($ip);
$md5=md5($ip);
$hex=str_split($md5,6);
?>
<html>
<style>
 .box{
width: 142px;
height: 360px;
background: <?php echo "#$hex[0];\n"; ?>
position: absolute;
top:0px;
left:0px;
}
 .box1{
width: 142px;
height: 360px;
background: <?php echo "#$hex[1];\n"; ?>
position: absolute;
top:0px;
left:142px;
}
 .box2{
width: 142px;
height: 360px;
background: <?php echo "#$hex[2];\n"; ?>
position: absolute;
top:0px;
left:284px;
}
 .box3{
width: 142px;
height: 360px;
background: <?php echo "#$hex[3];\n"; ?>
position: absolute;
top:0px;
left:426px;
}
 .text{
position:absolute;
left:0px;
top:0px;
font:KievitOT;
z-index:99;
}
</style>
<body marginwidth="0" marginheight="0" leftmargin="0" topmargin="0" style="overflow: hidden">
<div class="text"><img src="http://server/popup/5.png" usemap="#test" border="0"/>
</div>
<div class="box">
</div>
<div class="box1">
</div>
<div class="box2">
</div>
<div class="box3">
</div>
<map name ="test">
<area href="http://server/popup/colors2.php" target="_blank" shape="rect" coords="327,334,484,356" />
</body>
