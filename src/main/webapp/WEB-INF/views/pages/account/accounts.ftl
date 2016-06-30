<#ftl encoding='UTF-8'>
<#include "../layout_base.ftl">
<#macro title> 
	<title>Accounts manage</title>
</#macro>
<#macro css_custom> 
	<style>
		.btn-logout{
			margin: 10px;
			float: right;
		}
	</style>
	<!-- DataTables CSS -->
    <link href="/DemoJSON/resources/bower_components/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet">
</#macro>

<#macro html_custom>
	<#include "./modalAdd.ftl">
	<#include "./modalEdit.ftl">
	<#include "../../shared/modalConfirm.ftl">
</#macro>
<#macro page_content> 
	
	<div class="container">
		
		<div class="row">
			<!-- csrt for log out-->
			<form action="j_spring_security_logout" method="POST" id="logoutForm">
			  	<input type="hidden" 
					name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<button class="btn btn-primary btn-logout" onClick="formSubmit()"> Log out </button>
		</div>
		
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="panel panel-default">
	                <div class="panel-heading">
	                    <button class="btn btn-success" id="btn-new-account">New Account</button>
	                </div>
	                <!-- /.panel-heading -->
	                <div class="panel-body">
	                	<div  class="form-group row">
	                		<div class="col-md-5">
	                			<input type="text" class="form-control " placeholder="text to search" name="key" required="" autofocus="" id="search-key">
	                		</div>
	                			<button class="btn btn-default" onClick="searchAccount()">Search </button>
		                </div>
						<table id="tbl-account" class="table table-striped table-bordered table-hover tbl-responsive">
		                    <thead>
		                        <tr>
		                            <th class="col-lg-1 col-md-1 text-center">id</th>
		                            <th class="col-lg-2 col-md-2 text-center">name</th>
		                            <th class="col-lg-2 col-md-2 text-center">password</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    </tbody>
		                 </table>
		                 <span>
		                 	<button class="btn btn-primary" onClick="pagingSearch('lt')" id="btn-previous">&lt</button>
							showing <a id="offset-from"></a>-<a id="offset-to"></a> of <a id="records-total"></a>		                 	
		                 	<button class="btn btn-primary" onClick="pagingSearch('gt')" id="btn-next">&gt </button>
		                 </span>
		             </div>
		         </div>
			</div>
		</div>
	</div>
	
</#macro>

<#macro script_custom>
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}		
	</script>

	<!-- DataTables JavaScript -->
    <script src="/DemoJSON/resources/bower_components/datatables/media/js/jquery.dataTables.js"></script>
    <script src="/DemoJSON/resources/bower_components/file-saver/FileSaver.min.js"></script>
	<script src="/DemoJSON/resources/js/account.js"></script>
</#macro>
<!-- code shown here -->
<@display/>