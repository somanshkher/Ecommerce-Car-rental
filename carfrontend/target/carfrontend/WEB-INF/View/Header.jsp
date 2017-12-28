<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cat" %>
     <%@page isELIgnored="false"%>
     <%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>uponrent</title>

</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath }/">CAR RENTALS</a>
        </div>
        
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.contextPath }/">Home</a></li>
                
                <li class="dropdown">
              <a href="${pageContext.request.contextPath }/BrandByCategoryId/${cat.brandId}" class="dropdown-toggle" data-toggle="dropdown">CARS<b class="caret"></b></a>
                   
              <ul class="dropdown-menu w3-hoverable">
               <c:forEach items="${categoryList}" var="cat">
                    <li><a class ="dropdown-toggle" data-toggle="dropdown" href=" ${pageContext.request.contextPath}/BrandByID/${cat.brandId}">${cat.brandId}</a></li>
                        <ul class="dropdown-menu"></ul>
                        </c:forEach>
              </ul>
        
               <!--  <ul class="dropdown-menu"></ul>
                 <c:forEach items="${categoryList}" var="c">
                    <li><a class ="dropdown-toggle" data-toggle="dropdown" href=" ${pageContext.request.contextPath}/CategoryByID/${c.catType }">${c.catType }</a></li>
                          </c:forEach>
                           -->
                        
         <!--  <c:forEach items="${brandList}" var="cat">
                    <li><a class ="dropdown-toggle" data-toggle="dropdown" href=" ${pageContext.request.contextPath}/BrandByID/${cat.brandId}">${cat.brandId}</a></li>
                        <ul class="dropdown-menu"></ul>
                        </c:forEach> -->
                </li>
                 </ul>
        </div>
    </div>
    
                
                     
               <!--      <sec:authorize access="hasRole('ROLE_ADMIN')" >
               <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Admin <span class="caret"></span></a>
                   <ul class="dropdown-menu">
                    
                    <li><a href="Brand"><span class="glyphicon glyphicon-log-in"></span> Brand</a></li>
                    <li><a href="Category"><span class="glyphicon glyphicon-log-in"></span>Category</a></li>
                         <li><a href="Product"><span class="glyphicon glyphicon-log-in"></span> Product</a></li>
                    </ul>
                    
                   </li>
                   </sec:authorize>-->
                   
<!--                 <li><a href="AdminCard">Admin</a></li> -->
            <ul class="nav navbar-nav navbar-right">
                   <sec:authorize access="isAuthenticated()">
    <li class="nav-item" style="color:powderblue"> <br>Welcome <i>${pageContext.request.userPrincipal.name}</i></li>
       </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')" >
		<li><a href="adminHome">Admin</a></li>   
		</sec:authorize>    
        <sec:authorize access="hasRole('ROLE_USER')" >
                    <li class="nav-item"> <a href="${pageContext.request.contextPath}/all"><span class="glyphicon glyphicon-shopping-cart"></span><span class="badge badge-pill badge-primary">${numberProducts}</span></a></li>
                </sec:authorize>
                
                 <sec:authorize access="isAuthenticated()" >
                    <li class="nav-item"> <a href="${pageContext.request.contextPath}/Logout">Logout</a></li>
                </sec:authorize>
               
                <sec:authorize access="isAnonymous()">
                         <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li> 
                   		<li><a href="${pageContext.request.contextPath}/Register"><span class="glyphicon glyphicon-user"></span> Register</a></li>
         </sec:authorize>   
        </ul>
    
    </nav>

</body>
</html>
