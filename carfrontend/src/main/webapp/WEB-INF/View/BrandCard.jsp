<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
    <style>
    html {
    font-family: Lato, 'Helvetica Neue', Arial, Helvetica, sans-serif;
    font-size: 14px;
}
h5 {
    font-size: 1.28571429em;
    font-weight: 700;
    line-height: 1.2857em;
    margin: 0;
}
.card {
    font-size: 1em;
    overflow: hidden;
    padding: 0;
    border: none;
    border-radius: .28571429rem;
    box-shadow: 0 1px 3px 0 #d4d4d5, 0 0 0 1px #d4d4d5;
}
.card-block {
    font-size: 1em;
    position: relative;
    margin: 0;
    padding: 1em;
    border: none;
    border-top: 1px solid rgba(34, 36, 38, .1);
    box-shadow: none;
}
.card-img-top {
    display: block;
    width: 100%;
    height: auto;
}
.card-title {
    font-size: 1.28571429em;
    font-weight: 700;
    line-height: 1.2857em;
}
.card-text {
    clear: both;
    margin-top: .5em;
    color: rgba(0, 0, 0, .68);
}
.card-footer {
    font-size: 1em;
    position: static;
    top: 0;
    left: 0;
    max-width: 100%;
    padding: .75em 1em;
    color: rgba(0, 0, 0, .4);
    border-top: 1px solid rgba(0, 0, 0, .05) !important;
    background: #fff;
}
.card-inverse .btn {
    border: 1px solid rgba(0, 0, 0, .05);
}
.profile {
    position: absolute;
    top: -12px;
    display: inline-block;
    overflow: hidden;
    box-sizing: border-box;
    width: 25px;
    height: 25px;
    margin: 0;
    border: 1px solid #fff;
    border-radius: 50%;
}
.profile-avatar {
    display: block;
    width: 100%;
    height: auto;
    border-radius: 50%;
}
.profile-inline {
    position: relative;
    top: 0;
    display: inline-block;
}
.profile-inline ~ .card-title {
    display: inline-block;
    margin-left: 4px;
    vertical-align: top;
}
.text-bold {
    font-weight: 700;
}
.meta {
    font-size: 1em;
    color: rgba(0, 0, 0, .4);
}
.meta a {
    text-decoration: none;
    color: rgba(0, 0, 0, .4);
}
.meta a:hover {
    color: rgba(0, 0, 0, .87);
}
progress {
  /* Positioning */
  position:fixed;
  left: 0;
  top: 50px;
  /* Dimensions */
  width: 100%;
  height: 5px;
  /* Reset the appearance */
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  /* Get rid of the default border in Firefox/Opera. */
  border: none;
  /* Progress bar container for Firefox/IE10+ */
  background-color: transparent;
  /* Progress bar value for IE10+ */
  color: red;
}
progress::-webkit-progress-bar {
  background-color: transparent;
}
progress::-webkit-progress-value {
  background-color: red;
}
progress::-moz-progress-bar {
  background-color: red;
}
    </style>
<title>Insert title here</title>
</head>
<body>
<progress value="0" id="progressBar"></progress>
<%@include file="/WEB-INF/View/Header.jsp"%>

<div class="container">
       
       <div class="row" style="margin:50px;">
            
           <c:forEach items="${brandList}" var="c">
           
       			     <div class=" col-md-3" style="margin:20px;">
                    		<div class="card w3-animate-opacity" >
                    			<a href="${pageContext.request.contextPath }/BrandByID/${c.brandId}" value="${c.catId}" style="display:block;"><img class="card-img-top w3-animate-opacity" style="align-items:center;300px;height:200px;" src="${pageContext.request.contextPath }/resources/images/${c.brandID}.jpg"></a>
                    				<div class="card-block">
                        				<h5 class="text-bold w3-animate-opacity">${c.brandName}</h5>
                					</div>
                            </div>
                     </div>
           </c:forEach>
       </div>
</div>
</body>
<script>
$(document).ready(function(){
    
    var getMax = function(){
        return $(document).height() - $(window).height();
    }
    
    var getValue = function(){
        return $(window).scrollTop();
    }
    
    if('max' in document.createElement('progress')){
        // Browser supports progress element
        var progressBar = $('progress');
        
        // Set the Max attr for the first time
        progressBar.attr({ max: getMax() });
        $(document).on('scroll', function(){
            // On scroll only Value attr needs to be calculated
            progressBar.attr({ value: getValue() });
        });
      
        $(window).resize(function(){
            // On resize, both Max/Value attr needs to be calculated
            progressBar.attr({ max: getMax(), value: getValue() });
        });   
    }
    else {
        var progressBar = $('.progress-bar'), 
            max = getMax(), 
            value, width;
        
        var getWidth = function(){
            // Calculate width in percentage
            value = getValue();            
            width = (value/max) * 100;
            width = width + '%';
            return width;
        }
        
        var setWidth = function(){
            progressBar.css({ width: getWidth() });
        }
        
        $(document).on('scroll', setWidth);
        $(window).on('resize', function(){
            // Need to reset the Max attr
            max = getMax();
            setWidth();
        });
    }
});
$(document).ready(function(){
  
  $('#flat').addClass("active");
  $('#progressBar').addClass('flat');
    
  $('#flat').on('click', function(){
    $('#progressBar').removeClass().addClass('flat');
    $('a').removeClass();
    $(this).addClass('active');
    $(this).preventDefault();
  });
  $('#single').on('click', function(){
    $('#progressBar').removeClass().addClass('single');
    $('a').removeClass();    
    $(this).addClass('active');
    $(this).preventDefault();    
  });
  $('#multiple').on('click', function(){
    $('#progressBar').removeClass().addClass('multiple');
    $('a').removeClass();    
    $(this).addClass('active');
    $(this).preventDefault();    
  });
  $('#semantic').on('click', function(){
    $('#progressBar').removeClass().addClass('semantic');
    $('a').removeClass();    
    $(this).addClass('active');
    $(this).preventDefault();
    alert('hello');
  });
  $(document).on('scroll', function(){
      maxAttr = $('#progressBar').attr('max');
      valueAttr = $('#progressBar').attr('value');
      percentage = (valueAttr/maxAttr) * 100;
      
      if(percentage<49){
        document.styleSheets[0].addRule('.semantic', 'color: red');
        document.styleSheets[0].addRule('.semantic::-webkit-progress-value', 'background-color: red');
        document.styleSheets[0].addRule('.semantic::-moz-progress-bar', 'background-color: red');
      }
      else if(percentage<98){
        document.styleSheets[0].addRule('.semantic', 'color: orange');
        document.styleSheets[0].addRule('.semantic::-webkit-progress-value', 'background-color: orange');
        document.styleSheets[0].addRule('.semantic::-moz-progress-bar', 'background-color: orange');
      }
      else {
        document.styleSheets[0].addRule('.semantic', 'color: green');
        document.styleSheets[0].addRule('.semantic::-webkit-progress-value', 'background-color: green');
        document.styleSheets[0].addRule('.semantic::-moz-progress-bar', 'background-color: green');
      }      
  });
  
});
</script>
</html>