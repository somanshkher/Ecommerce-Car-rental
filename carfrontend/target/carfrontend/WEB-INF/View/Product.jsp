<%@include file="Header.jsp"%>
<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fm" %>  
<html>
<head>
    <meta charset="utf-8">
    <title>Bootstrap Navbar and Slider Overlay Text - Bootsnipp.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">

  
   </style>
</head>
<body>

<c:if test="${not empty msg}">
           <h3 style="text-align:center;"> ${msg}</h3>
</c:if>

<div class="container">

  
  <fm:form action="${pageContext.request.contextPath}/addProduct"  method="post" enctype="multipart/form-data" commandName="product" modelAttribute="product" class="form-horizontal">
    
    
    <div class="form-group">
      <c:if test="${not empty product.proNm }"> 
       <label class="control-label col-sm-3" >Product Id:</label>
      <div class="col-sm-3">
  
        <fm:input type="text" class="form-control" path="proRn"></fm:input>
      </div> 
     </c:if>

      
    </div>
     <div class="form-group">
      <label class="control-label col-sm-3" >Product Name:</label>
      <div class="col-sm-3">   
           
        <fm:input input="text" class="form-control"  path="proNm"></fm:input>
        <fm:errors path="proNm" cssStyle="color:#ff0000;"></fm:errors>
       </div>
    </div>
       
      
    
    <div class="form-group">
      <label class="control-label col-sm-3" >Description:</label>
      <div class="col-sm-3">   
           
        <fm:input input="text" class="form-control"  path="proType"></fm:input>
       
      </div>
    </div>
    
      <div class="form-group">
       <label class="control-label col-sm-3" >Product Image:</label>
      <div class="col-sm-3">
   <fm:input type="file" class="form-control" path="image" required="true"></fm:input>
    </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-3" >Price:</label>
      <div class="col-sm-3">   
           
        <fm:input input="text" class="form-control"  path="price"></fm:input>
       
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-3" >Category:</label>
      <div class="col-sm-3">   
        
         
       <fm:select path="categoryId">
       <fm:option value="select">----SELECT---</fm:option>
       <c:forEach items="${categoryList}" var="cat">
       <fm:option value="${cat.catId}">${cat.catId}</fm:option>
       </c:forEach>
       </fm:select>  
      </div>
    </div>
    <div class="form-group">        
      
      <label class="control-label col-sm-3" >Quantity:</label>
        <div class="col-sm-3">
        <fm:input type="text" class="form-control"  path="qty"></fm:input>
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-3 col-sm-3">
    <c:if test="${empty product.proNm }">
        <fm:button type="submit" class="btn btn-default">Register</fm:button>
   </c:if>
      </div>
      <div class="col-sm-offset-2 col-sm-3">
      <c:if test="${ not empty product.proNm }">
        <fm:button type="submit" class="btn btn-default">Update</fm:button>
       </c:if>
      </div>
    </div>
  </fm:form>
  <c:if test="${not empty productList}">
<h1>Product</h1>
<table style="width:100%">


<tr>
<th>PId</th>
<th>Product name</th>
<th>Description</th>
<th>Price &#8377</th>
<th>Qty</th>
<th>category</th>
<th colspan="2">Action</th>
</tr>

<c:forEach items="${productList}" var="prd">

<tr>

<td>${prd.proRn}</td>
<td>${prd.proNm}</td>
<td>${prd.proType}</td>
<td>${prd.price}</td>
<td>${prd.qty}</td>
<td>${prd.categoryId}</td>

<td><a href="<c:url value='updateProduct/${prd.proRn}'/>"class="btn btn-xs btn-warning"><span class="glyphicon glyphicon-edit"></span>&nbsp Edit</a></td>
<td><a href="<c:url value='deleteProduct/${prd.proRn}'/>   " class="btn btn-xs btn-danger"><span class="glyphicon glyphicon-trash"></span>&nbsp Del &nbsp</a></td>
</tr>
</c:forEach>

</table>
</c:if>
  
</div>



</body>
</html>