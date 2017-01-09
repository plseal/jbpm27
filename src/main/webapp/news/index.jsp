<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="../sessiontimeout.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.4.3/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.4.3/themes/icon.css" />
<link href="${pageContext.request.contextPath}/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/3.3.0/css/buttons.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript">

$(function(){
	$('#listTable').datagrid({
	    url:'./listNews.do',
	    rownumbers:true,
	    
	    columns:[[
			{field:'id',            title:'ID',width:0,align:'center',hidden:'true'},
			{field:'xinxilaiyuan',           title:'信息来源 ',width:0,align:'left',hidden:'true'},
			{field:'title',            title:'详细内容 ',width:0,align:'left',
	            formatter:function(value,rec){  
	            	var detail = ""
	            	//alert(rec.url);
	            	if (rec.url == null) {
	            		detail = "  <a class='editcls' onclick='#'"  
	    		            + "color=blue href='./"+rec.title+".htm'>"+rec.title+"</a>";
	            	} else {
	            		//pdf
	            		detail = "  <a class='editcls' onclick='#'"  
	    		            + "color=blue href='./"+rec.url+"'>"+rec.title+"</a>";
	            	}
	                
		            
	            	return detail ;
	            } 	
			
			},
			{field:'url',           title:'url ',width:0,align:'left',hidden:'true'}
	        /*
			,{field:'opt',            title:'操作',width:0,align:'center',  
	            formatter:function(value,rec){  
	                var update = "  <a class='editcls' onclick='#'"  
		            + "color=blue href='./standardDatabase/update.do?id="+rec.id
															 +"'>修正</a>";
	                var del = " | <a class='editcls' onclick='#'"  
			            + "color=blue href='./standardDatabase/delete.do?id="+rec.id
															 +"'>删除</a>";  		            
	            	return update + del ;
	            }  
	        }
			*/
	    ]]
	});
});


</script>
</head>
<body>
<div class="container">
	<div class="row">
		内部资讯
	</div>
	<div class="row">
		  <a href="${pageContext.request.contextPath}/news/indexS1.jsp" class="button button-block button-rounded button-primary button-large">更新内部资讯</a>
	</div>
	<div class="row">
	    <form method="post" id="myform">
	   
	 
	
			<table id="listTable" ></table>
		</form>
	</div>
	
		
</div>
</body>
</html>
	