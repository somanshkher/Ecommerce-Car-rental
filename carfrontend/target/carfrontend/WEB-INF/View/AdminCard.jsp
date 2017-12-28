<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/admincard.css"/>
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<%@ page isELIgnored="false" %>
<title>Admin Panel</title>
</head>
<body>
<div class="container">
    <div class="row">
   
        <div class="col-md-3">
            <div class="card">
                <div class="card-image">
                    <img class="img-responsive" src="">
                </div>
                
                <div class="card-content">
                    <p>Add Car Corresponding To Brand By Clicking Me</p>
                </div>
                
                <div class="card-action">
                     <a href="${pageContext.request.contextPath }/admin/Product">Car</a>
                </div>
            </div>
        
        
       
            <div class="card">
                <div class="card-image">
                    <img class="img-responsive" src="">
                </div>
                
                <div class="card-content">
                    <p>Add Brand Corresponding to Category By Clicking Me</p>
                </div>
                
                <div class="card-action">
                   
                    <a href="${pageContext.request.contextPath }/admin/Brand">Brand</a>
                </div>
            </div>
        </div>
 
            <div class="card">
                <div class="card-image">
                    <img class="img-responsive" src=""/>
                </div>
                
                <div class="card-content">
                    <p>Add Category By Clicking Me</p>
                </div>
                
                <div class="card-action">
                   
                    <a href="${pageContext.request.contextPath }/admin/Category">Category</a>
                </div>
            </div>
       </div>
    </div>
       

</body>
</html>