function Account(id, name, password) {
	this.id = id;
	this.name = name;
	this.password = password;
}
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

var table = $('#tbl-account').DataTable({
	processing : true,
	searching : false,
	paging : false,
	info : false,
});

$(document).ready(function() {
	// get all account data, pull into table
	requestSearch();

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

/** ************************************ */
/** ************************************ */
var page = 1;
var limit = 10;
var key = "";

/* onClick search */
function searchAccount() {
	key = $('input#search-key').val();
	page = 1;
	limit = 10;
	requestSearch();
}

/* paging onClicked */
function pagingSearch(a) {
	if (a == 'lt') {
		page -= 1;
	} else if (a == 'gt') {
		page += 1;
	}

	if (page > 0) {
		requestSearch();
	}
}

/* request AJAX */
function requestSearch() {
	$.ajax({
		type : 'POST',
		url : '/DemoJSON/accounts/search',
		data : {
			"key" : key,
			"page" : page,
			"limit" : limit,
		},
		timeout : 10000,
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(data) {
			console.log(data);
			var tbldata = data.data;
			var totalRecord = parseInt(data.totalRecord);
			var totalRecordFiltered = parseInt(data.totalRecordFiltered);

			// clear current table, push new data
			table.clear().draw();
			if (tbldata != null) {
				for (i = 0; i < tbldata.length; i++) {
					table.row.add([ tbldata[i].id, tbldata[i].name, tbldata[i].password ]).draw();
				}
			}

			// change paging
			var offsetFrom = (page - 1) * limit + 1;
			var offsetTo = offsetFrom + totalRecordFiltered - 1;
			$('#offset-from').text(offsetFrom);
			$('#offset-to').text(offsetTo);
			$('#records-total').text(totalRecord);

			if (page > 1) {
				$('#btn-previous').prop("disabled", false);
			} else {
				$('#btn-previous').prop("disabled", true);
			}
			if (page * limit < totalRecord) {
				$('#btn-next').prop("disabled", false);
			} else {
				$('#btn-next').prop("disabled", true);
			}

		},
		error : function(data) {
			console.log(data);
		}
	});
}

/** ************************************ */
/** ************************************ */

var action_command = "";
var currentAccount;

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