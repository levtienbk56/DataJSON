<#ftl encoding='UTF-8'>
<#include "../layout_base.ftl">
<#macro title> 
	<title>Login</title>
</#macro>

<!-- custom css -->
<#macro css_custom>
	<style>
		.center{
			margin: auto;
		    width: 40%;
		    border: 3px solid #73AD21;
		    padding: 20px;
		    margin-top: 100px;
		}
		.alert{
			text-align:center;
		}
	</style>
</#macro>

<#macro page_content> 
	<div class="container">
    	<div class="center">
			<form class="form-signin"  action="j_spring_security_check" method='POST'>
				<h1 class="form-signin-heading text-muted text-center">Sign In</h1>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Username" name="username" required="" autofocus="">
					<input type="password" class="form-control" placeholder="Password"  name="password" required="">
				</div>
					<#if (error??)>
						<div class="alert alert-warning text-center"> ${error} </div>
					</#if>
					<#if (msg??)>
						<div class="alert alert-success text-center"> ${msg} </div>
					</#if>
				<button class="btn bn-lg btn-primary btn-block" type="submit">
					Sign In
				</button>
				<!-- enable csrf protection -->
				<input type="hidden" 
					name="${_csrf.parameterName}"
	            	value="${_csrf.token}" />
			</form>
		</div>
		</div>
	<!-- </div class="container"> --> 
	</div>
</#macro>

<!-- code shown here -->
<@display/>