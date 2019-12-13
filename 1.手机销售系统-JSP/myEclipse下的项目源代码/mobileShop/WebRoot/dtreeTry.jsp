<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dtreeJsUrl = path+"/toolLibs/dtree/dtree.js";
String dtreeCssUrl = path+"/toolLibs/dtree/dtree.css";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dtreeTry.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=dtreeCssUrl%>">
    <script type="text/javascript" src="<%=dtreeJsUrl%>"></script>
    
  </head>
	 <body> 
		<div class="dtree"><!--创建一个div层，指定class为“dtree”，此时该层就引用了dtree的样式 --> 
		<script type="text/javascript"> 
			d = new dTree('d');//new一个树对象 
			//设置树的节点及其相关属性 
			d.add(0,-1,'My example tree'); 
			d.add(1,0,'Node 1','toolLibs/dtree/example01.html'); 
			d.add(2,0,'Node 2','toolLibs/dtree/example01.html'); 
			d.add(3,1,'Node 1.1','toolLibs/dtree/example01.html'); 
			d.add(4,0,'Node 3','toolLibs/dtree/example01.html'); 
			d.add(5,3,'Node 1.1.1','toolLibs/dtree/example01.html'); 
			d.add(6,5,'Node 1.1.1.1','toolLibs/dtree/example01.html'); 
			d.add(7,0,'Node 4','toolLibs/dtree/example01.html'); 
			d.add(8,1,'Node 1.2','toolLibs/dtree/example01.html'); 
			d.add(9,0,'My Pictures','toolLibs/dtree/example01.html','Pictures I\'ve taken over the years','','','toolLibs/dtree/img/imgfolder.gif'); 
			d.add(10,9,'The trip to Iceland','toolLibs/dtree/example01.html','Pictures of Gullfoss and Geysir'); 
			d.add(11,9,'Mom\'s birthday','toolLibs/dtree/example01.html'); 
			d.add(12,0,'Recycle Bin','toolLibs/dtree/example01.html','','','toolLibs/dtree/img/trash.gif'); 
			//config配置，设置文件夹不能被链接，即有子节点的不能被链接。 
			d.config.folderLinks=false; 
			document.write(d); 
		</script> 
		</div> 
	</body>
</html>
