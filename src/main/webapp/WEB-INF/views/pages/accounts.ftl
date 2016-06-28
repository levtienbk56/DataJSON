<#ftl encoding='UTF-8'>
<#include "./layout_base.ftl">
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
		             </div>
		         </div>
			</div>
		</div>
	</div>
	
	<!-- modal edit-event -->
	<div class="modal fade" id="modal-edit-account" role="dialog">
		 <div class="modal-dialog">
			  <!-- Modal content-->
			  <div class="modal-content form-horizontal">
				   <div class="modal-header">
					    <button id="close-insertE" type="button" class="close" data-dismiss="modal">&times;</button>
					    <h4 class="modal-title">Edit Account</h4>
				   </div>
				   <!-- /.modal-header -->
				
				   <div class="modal-body">
				   		<!-- notification -->
				   		<div class="modal-notice text-center">
					    </div>
					    
					    <table class="table">
					    	<thead>
		                        <tr>
		                            <th class="col-md-2">id</th>
		                            <th class="col-md-4">name</th>
		                            <th class="col-md-4">password</th>
		                        </tr>
		                    </thead>
		                    	<tr>
		                    		<td class="edit-id"></td>
		                    		<td class="edit-name"> <input type="text" class="form-control"> </td>
		                    		<td class="edit-password"> <input type="text" class="form-control"></td>
		                    	</tr>
		                    <tbody>
		                    </tbody>
					    </table>
					</div>
					<!-- /.modal-body -->
					
				   	<div class="modal-footer">
					    <button type="button" class="btn btn-danger" onClick="deleteAccount()" data-dismiss="modal">
					     	<i class="fa fa-trash"></i> Delete
					    </button>
					    
					    <button type="button" class="btn btn-success" onClick="updateAccount()" data-dismiss="modal">
					     	<i class="fa fa-check"></i>Update
					    </button>
					    
					    <button id="reject" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				   	</div>
				   	<!-- /.modal-footer -->
			  	</div>
			  	<!-- modal-content -->
		 </div>
		 <!-- /.modal-dialog -->
	</div>
	<!-- modal add-event -->
	<div class="modal fade" id="modal-add-account" role="dialog">
		 <div class="modal-dialog">
			  <!-- Modal content-->
			  <div class="modal-content form-horizontal">
				   <div class="modal-header">
					    <button id="close-insertE" type="button" class="close" data-dismiss="modal">&times;</button>
					    <h4 class="modal-title">New Account</h4>
				   </div>
				   <!-- /.modal-header -->
				
				   <div class="modal-body">
				   		<!-- notification -->
				   		<div class="modal-notice text-center">
					    </div>
					    
					    <table class="table">
					    	<thead>
		                        <tr>
		                            <th class="col-md-4">name</th>
		                            <th class="col-md-4">password</th>
		                        </tr>
		                    </thead>
		                    	<tr>
		                    		<td class="edit-name"> <input type="text" class="form-control"> </td>
		                    		<td class="edit-password"> <input type="text" class="form-control"></td>
		                    	</tr>
		                    <tbody>
		                    </tbody>
					    </table>
					</div>
					<!-- /.modal-body -->
					
				   	<div class="modal-footer">
					    <button type="button" class="btn btn-success" onClick="addAccount()" data-dismiss="modal">
					     	<i class="fa fa-check"></i>Update
					    </button>
					    
					    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				   	</div>
				   	<!-- /.modal-footer -->
			  	</div>
			  	<!-- modal-content -->
		 </div>
		 <!-- /.modal-dialog -->
	</div>
	<!-- /.modal fade-->
	<div class="modal fade" id="confirm-modal" role="dialog">
		 <div class="modal-dialog">
			  <!-- Modal content-->
			  <div class="modal-content">
				   <div class="modal-header">
					    <h4 class="modal-title"></h4>
				   </div>
				   <div class="modal-footer">
					    <button type="button" class="btn btn-success" data-dismiss="modal" onClick="commandConfirmed()">
					     	<i class="fa fa-check"></i> Yes
					    </button>
					    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
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
		function showConfirmModal(msg){
			$("#confirm-modal").modal('show');
			$("#confirm-modal .modal-title").text(msg);
		}
		
		function hideConfirmModal(){
			$("#confirm-modal").modal('hide');
		}
	</script>

	<!-- DataTables JavaScript -->
    <script src="/DemoJSON/resources/bower_components/datatables/media/js/jquery.dataTables.js"></script>
	<script src="/DemoJSON/resources/js/account.js"></script>
</#macro>
<!-- code shown here -->
<@display/>