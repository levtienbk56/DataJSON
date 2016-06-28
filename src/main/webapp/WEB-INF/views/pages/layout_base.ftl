<#ftl encoding='UTF-8'>

<!-- meta data -->
<#macro meta>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- csrf enabled -->
	<meta name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
 </#macro>
<!-- title-->
<#macro title>
	<title>Demo JSON</title>
</#macro>

<!-- global css-->
<#macro css_global>
	<!-- Bootstrap Core CSS -->
    <link href="/DemoJSON/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
</#macro>

<!-- custom css -->
<#macro css_custom></#macro>

<#macro html_custom>
</#macro>

<!-- page content-->
<#macro page_header></#macro>
<#macro page_content></#macro>
<#macro page_footer></#macro>

<!-- global script -->
<#macro script_global>
	<!-- jQuery -->
    <script src="/DemoJSON/resources/bower_components/jquery/dist/jquery.min.js"></script>
   	<!-- Bootstrap Core JavaScript -->
    <script src="/DemoJSON/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</#macro>

<!-- custom script-->
<#macro script_custom></#macro>

<#macro display> 
	<!DOCTYPE html>
	<html>
	<head>
		<@meta/>
    	<@title/>
		<@css_global/>    
		<@script_global/>
		<@css_custom/>
	</head>
	<body>
		<@html_custom/>
		<@page_header/>
		<@page_content/>
		<@page_footer/>
		<@script_custom/>
	</body>
	</html>
</#macro>