<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %>
    <%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <%@ include file="Header.jsp" %>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
         <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>
<br>
<br>
<br>

		 <div class="space"></div>
<div class="container">
	<h2 class="heading-one">Cart</h2>
	<c:if test="${not empty success }">
		<div class="alert alert-success">${success}</div>
	</c:if>
	<c:if test="${empty cartList }">
		<div class="alert alert-warning">You have not selected any car.
			into cart.</div>
	</c:if>
	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error }</div>
	</c:if>
	<c:if test="${not empty cartList}">
		<table class="table table-bordered">
			<tr>
				
				<th>Car Name</th>
				<th>Price</th>
				<th>Car Description</th>
				<th width="135">Actions</th>
			</tr>
		
			<c:forEach items="${cartList}" var="cart">
				<tr>
				<td>${cart.productName}</td>
					<td>&#8377 ${cart.price}</td>
					<td>${cart.quantity }</td>
					<td><a href="<c:url value='/myCart/deleteItem/${cart.cartID}'/>"> <span class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
			</c:forEach>
			
		</table>
		</c:if>
		
		<hr>
		<div class="pull-right">
		
			
			 <a href="<c:url value="/order"/>" class="btn btn-primary">Checkout</a>
		</div>
		<a href="<c:url value="/myCart/clearCart" />"
			class="btn btn-danger">Clear Cart</a>
			<div style="text-align:center">
		<a href="<c:url value="/" />"
			class="btn btn-success btn-lg">Continue Renting</a><br>
				<h4>Total Amount: <em><b class="text-success">&#8377 ${totalAmount }</b></em>
			&nbsp;</h4>
			</div>
			
		
		</div>
</body>
</html>