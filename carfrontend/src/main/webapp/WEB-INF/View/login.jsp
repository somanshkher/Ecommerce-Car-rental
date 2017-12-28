<%@include file="Header.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
     <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<br>
<br>
<br>
${msg}
<!-- <form action="logg" method="POST" >
Username<input name="name"/>
Password<input name="password"/>
<input type="submit" value="submit"/>
</form>
-->
<script src="https://use.fontawesome.com/1dec14be15.js"></script>
    
   
    
    <div class="container-fluid stylish-form">
    
      <h2 class="text-center">Login</h2>
      <div class="row mar20" >
        <div class="col-md-12 col-sm-12 col-xs-12">
          <div class="inner-section">
          <form action="logg" method="post">
            
                
                <div class="input-group">
                  <span class="input-group-addon" width='500px'><i class="fa fa-pencil "></i></span>
                  <input type="text" class="form-control" name="name" placeholder="Username..." />
  
                </div>
                <br>
                <br>
                
                
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-key"></i></span>
                  <input type="password" class="form-control" name="password" placeholder="Password..."/>
                </div>
                <br>
                <br>
                <br>
                <br>
                
      <div class="footer text-center">
                  <input type="submit" value="login"class="btn btn-neutral btn-round btn-lg">
                 
                </div>
             </form>
              </div>
              
             <c:if test="${not empty loggedInUserName }">
				<div class="alert alert-danger">Enter Correct Details</div>
			</c:if>
            
          </div>
        </div>
      </div>
</body>
</html>