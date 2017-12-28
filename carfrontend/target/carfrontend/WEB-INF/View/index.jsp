<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head >
  <title>cars</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>

  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
 </style>
    
    </head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<sec:authorize access="hasRole('ROLE_ADMIN')" >
<jsp:forward page="/adminHome"></jsp:forward>
</sec:authorize>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" ></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active">
      <img src="" class="img-responsive">
      <div class="container">
        <div class="carousel-caption">
          </div>
      </div>
    </div>
    
    <div class="item">
      <img src="resources/carrental/car1.jpg"  width="460" height="345">
      <div class="container">
        <div class="carousel-caption">
          
        </div>
      </div>
    </div>
    <div class="item">
      <img src="resources/carrental/car2.jpg"  width="460" height="345">
      <div class="container">
        <div class="carousel-caption">
          
        </div>
      </div>
    </div>
    <div class="item">
      <img src="resources/carrental/car3.jpg"  width="460" height="345">
      <div class="container">
        <div class="carousel-caption">
          
        </div>
      </div>
    </div>
    <div class="item">
      <img src="resources/carrental/car4.jpg" width="460" height="345">
      <div class="container">
        <div class="carousel-caption">
          
        </div>
      </div>
    </div>
    <div class="item">
      <img src="resources/carrental/car5.jpg"  width="460" height="345">
      <div class="container">
        <div class="carousel-caption">
          
        </div>
      </div>
    </div>
    
  </div>
 
  
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <i class="glyphicon glyphicon-chevron-left"></i>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <i class="glyphicon glyphicon-chevron-right"></i>
  </a>  
</div>
</body>
</html>
