function Account(id, name, password) {
	this.id = id;
	this.name = name;
	this.password = password;
}
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
var table = $('#tbl-account').DataTable({
	responsive : true
});
var action_command = "";
var currentAccount;

$(document).ready(function() {
	// get all account data, pull into table
	requestAccounts();

	// click on order, show edit modal
	$('#tbl-account tbody').on('click', 'tr', function() {
		$('#modal-edit-account').modal('show');

		// get data from row table
		var tds = this.getElementsByTagName("td");
		var id = tds[0].innerHTML;
		var name = tds[1].innerHTML;
		var pass = tds[2].innerHTML;

		currentAccount = new Account(id, name, pass);

		// push data into edit modal
		$('#modal-edit-account td.edit-id').text(id);
		$('#modal-edit-account td.edit-name input').val(name);
		$('#modal-edit-account td.edit-password input').val(pass);
	});

	// click add new account
	$('#btn-new-account').click(function() {
		// get data from row table
		$('#modal-add-account').modal('show');
	});
});

function deleteAccount() {
	action_command = "DELETE_ACCOUNT";
	showConfirmModal("Do you want to delete this account?");
}
function updateAccount() {
	var name = $('#modal-edit-account td.edit-name input').val();
	var password = $('#modal-edit-account td.edit-password input').val();
	if (name == "" || password == "") {
		alert("input empty");
		return;
	}

	currentAccount.name = name;
	currentAccount.password = password;
	action_command = "UPDATE_ACCOUNT";
	showConfirmModal("Do you want to update this account?");
}
function addAccount() {
	name = $('#modal-add-account td.edit-name input').val();
	password = $('#modal-add-account td.edit-password input').val();

	if (name == "" || password == "") {
		alert("input empty");
		return;
	}
	currentAccount = new Account(0, name, password);
	action_command = "ADD_ACCOUNT";
	showConfirmModal("Do you want to add this new account?");
}
function commandConfirmed() {
	if (action_command == "DELETE_ACCOUNT") {
		requestDeleteAccount();
	} else if (action_command == "UPDATE_ACCOUNT") {
		requestUpdateAccount();
	} else if (action_command == "ADD_ACCOUNT") {
		requestAddAccount();
	}
}
function requestAccounts() {
	$.ajax({
		type : 'POST',
		url : '/DemoJSON/accounts',
		timeout : 10000,
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(data) {
			console.log(data.length);
			// clear current table
			table.clear().draw();
			if (data != null) {
				for (i = 0; i < data.length; i++) {
					table.row.add([ data[i].id, data[i].name, data[i].password ]).draw();

				}
			}
		},
		error : function(data) {
			console.log(data);
		}
	});
}

function requestDeleteAccount() {
	$.ajax({
		type : 'POST',
		url : '/DemoJSON/accounts/delete',
		data : {
			id : currentAccount.id
		},
		timeout : 10000,
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(data) {
			console.log(data);
			location.reload();
		},
		error : function(data) {
			console.log(data);
		}
	});
}

function requestUpdateAccount() {
	$.ajax({
		type : 'POST',
		url : '/DemoJSON/accounts/update',
		contentType : "application/json",
		dataType : 'json',
		data : JSON.stringify(currentAccount),
		timeout : 10000,
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(data) {
			console.log(data);
			location.reload();
		},
		error : function(data) {
			console.log(data);
		}
	});
}

function requestAddAccount() {
	$.ajax({
		type : 'POST',
		url : '/DemoJSON/accounts/insert',
		contentType : "application/json",
		dataType : 'json',
		data : JSON.stringify(currentAccount),
		timeout : 10000,
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(data) {
			console.log(data);
			location.reload();
		},
		error : function(data) {
			console.log(data);
		}
	});
}