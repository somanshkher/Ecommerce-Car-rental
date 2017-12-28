<%@include file="Header.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
     
    <%@page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sh" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
   </style>
<title>Category</title>
</head>
<body>
<div class="container">
<sh:form action="${pageContext.request.contextPath}/addCategory" method="POST" modelAttribute="category">
	
	<div class="form-group">
	<c:if test="${not empty category.catName}">
	ID<sh:input path="catId" readOnly="true" disabled="true"/>
	<sh:hidden path="catId"/>
	</c:if>
 	</div>
    <div class="form-group">
      <sh:label  path="catName">Category Name:</sh:label>
      <sh:input class="form-control"  path="catName" placeholder="Enter Category Name" />
    </div>
      <div class="form-group">
      <sh:label  path="catType">Category Type</sh:label>
      <sh:input class="form-control"  path="catType" placeholder="Enter category type" />
    </div>
		  <div class="form-group">
	<sh:select path="brnds">
	<sh:option value="select">----SELECT---</sh:option>
	<c:forEach items ="${brandList}" var="c">
	<sh:option value="${c.brandName}"></sh:option>
	</c:forEach>
</sh:select> 
</div>
<c:if test="${empty category.catName}">
 <sh:button type="submit" class="btn btn-default">Add</sh:button>
 </c:if>
<c:if test="${not empty category.catName}">
 <sh:button type="submit" class="btn btn-default">Update</sh:button>
 </c:if>
 
</sh:form>
</div>

<div class="container">
   
  <c:if test="${not empty categoryList}">
<table border=1 class="table table-striped" >
<thead>
      <tr>
      <th>Category Name</th>
  		<th>Category Type</th>
  		<th> Brands</th>
      <th>edit</th>
      <th>delete</th>
      </tr>
</thead>
<tbody>
<c:forEach items="${categoryList}" var="cat">
<tr>
<td>${cat.catName}</td>
<td>${cat.catType }</td>
<td>${cat.brnds}</td>
<td><a href="<c:url value='updateCategory/${cat.catId}'/>">Edit</a></td>
<td><a href="<c:url value='deleteCategory/${cat.catId}'/>">Delete</a></td>
</tr>
</c:forEach>

</tbody>
</table>
</c:if>
    
  
</div>
 


</body>
</html>