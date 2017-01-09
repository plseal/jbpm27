<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 栅格系统，移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="visio.css"/>
<link href="${pageContext.request.contextPath}/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/3.3.0/css/buttons.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/jquery-easyui-1.4.3/jquery.min.js"></script>

<title>
indexS1.jsp
</title>
<script type="text/javascript" language="javascript">
function UpdateTooltip(){};
function OnShapeClick(){};
</script>

<script src="png_1.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript" language="javascript">
	if( (parent.isSVG) || 
		(parent.isVML && parent.vmlSupported) || 
		(parent.isXAML && parent.isUpLevel)) 
	{
		location.replace(parent.g_FileList[parent.g_CurPageIndex].PriImage);
	}
</script>


<script type="text/javascript" language="javascript">
var pageID = 0;
var isUpLevel = parent.isUpLevel;
var OnShapeClick = null;
if (!parent.isMac)
{
	OnShapeClick = parent.OnShapeClick;
}

var OnShapeKey = parent.OnShapeKey;
var UpdateTooltip = parent.UpdateTooltip;
var clickMenu = parent.clickMenu;
var toggleMenuDiv = parent.toggleMenuDiv;
var toggleMenuLink = parent.toggleMenuLink;
var GoToPage = parent.GoToPage;


if (parent.isUpLevel)
{

	if (parent.g_FirstPageToLoad != null && parent.g_FirstPageToLoad.length > 0)
	{
		if (parent.g_FileList[parent.g_CurPageIndex].PageID != pageID)
		{
			var fileEntry = parent.g_FileList[parent.g_CurPageIndex];
			var fileToLoad = fileToLoad = fileEntry.PriImage;
			if (fileEntry.SecImage.length > 0)
			{
				fileToLoad = fileEntry.SecImage;
			}

			location.replace(fileToLoad);
		}

		parent.g_FirstPageToLoad = null;
	}


	var viewMgr = new parent.CViewMgr();
	parent.viewMgr = viewMgr;

	viewMgr.SupportsDetails = true;
	viewMgr.SupportsSearch = true;

	viewMgr.put_Location = ViewMgrSetRasterLocation;
	viewMgr.visBBoxLeft = 1.020459;
	viewMgr.visBBoxRight = 10.810565;
	viewMgr.visBBoxBottom = 4.934957;
	viewMgr.visBBoxTop = 7.678901;
	viewMgr.highlightDiv = null;
}

function load ()
{
	if(isUpLevel)
	{
		arrowdiv.innerHTML = '<img id="arrowgif" alt="显示所选形状的位置" src="arrow.png"/>';

		var pageIndex = parent.PageIndexFromID (pageID);
		parent.CurPageUpdate (pageIndex);
	}
}

function unload()
{
	if(isUpLevel)
	{
		viewMgr = null;
		parent.viewMgr = null;
	}
}

window.onload = load;
window.onunload = unload;
document.onclick = clickMenu;

</script>
<style type="text/css"> 
body {
	
	padding: 10px;
}
div.banner {
	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	_top: expression(eval(document.body.scrollTop));
	_left: expression(eval(document.body.scrollLeft));
	width: 100%;
	_width: expression(eval(document.body.clientWidth));
	margin: 0;
	padding: 3px;
	padding-left: 6px;
	background:lime;
	background-color: #FFFFC6;
	font: 11px tahoma,arial,serif;
	border-bottom: 2px ridge #FFFFC6;
}
</style>
</head>

<body class="pageView" bgcolor="#FFFFFF" style="margin: 0px">
	
<script type="text/javascript" language="javascript">
// Displays the banner prompt to install Silverlight
if (parent.slSupported && !parent.slInstalled)
{
	var slBanner = document.createElement("div");
	slBanner.className = "banner";
	slBanner.innerHTML = '若要启用全部功能(例如扫视和缩放)，<a href="http://www.microsoft.com/silverlight/resources/install.aspx" target="parent">单击此处</a> 需要安装 Silverlight 插件。';

	document.body.appendChild(slBanner);
	document.body.style.paddingTop = "2.5em";
}
function clickDiv(strVal) {
	  document.getElementById("strDivView").value = strVal;
	  
}
function gotoNewsStep2(strVal) {
	
	if ($("#strDivView").val() == ""){
		$("#div_alert_danweiNoBeSetted").attr("class","alert alert-danger");
	}else {
		if ($("#strDivView").val() == "发布资讯"){
			document.all.myform.action="${pageContext.request.contextPath}/news/indexS2.jsp?news_div=" + $("#strDivView").val() + "";	
		} else {
			document.all.myform.action="${pageContext.request.contextPath}/news/indexS2_Del.jsp?news_div=" + $("#strDivView").val() + "";
		}
		
		document.all.myform.submit(); 
	}
	  
}


</script>
<form method="post" id="myform"  >
<!-- bootstrap 栅格容器 -->
<div class="container">
	<!-- bootstrap 栅格容器  row start-->
	<div class="row">
		第一步：功能选择
		<div class="progress">
		    <div class="progress-bar" role="progressbar" aria-valuenow="60" 
		        aria-valuemin="0" aria-valuemax="100" style="width: 33%;">
		        <span class="sr-only">33% 完成</span>
		    </div>
		</div>
	</div>
	<div class="row">
		<br/>
		<button type="button" class="btn btn-info btn-lg" onclick="clickDiv('发布资讯');">发布资讯</button>
		<button type="button" class="btn btn-info btn-lg" onclick="clickDiv('删除资讯');">删除资讯</button>
		<br/>
		需要更改资讯时，请删除资讯重新发布		
				
		
	</div>
	<div class="row">
		<br/>
		<div class="form-group">
		
    		<label for="inputDanwei" class="control-label">请点击上面的按钮选择</label><i class="icon-arrow-up"></i>
		    <div >
		      <input class="form-control" id="strDivView" type="text" placeholder="还未选择功能" disabled>
		    </div>
  		</div>
		<div class="alert alert-warning hidden" id = "div_alert_danweiNoBeSetted" >警告：还未选择</div>	
	
	</div>
	
	

	
	<div class="row">
		<br/>
		<a href="javascript:gotoNewsStep2();"  class="button button-block button-rounded button-primary button-large">下一步</a>
		
	
	</div>
</div>
</form>

</body>
</html>
