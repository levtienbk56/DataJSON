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