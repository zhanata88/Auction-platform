<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>  
<style type="text/css">body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}</style>

<style>
 .mySlides {display:none;}
 
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #FFF5EE;
    color: black;
    padding: 14px 20px;
   margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

/* Extra styles for the cancel button */
.cancelbtn {
   width: auto;
    padding: 10px 18px;
    background-color: #f44336;
    font-size: 10px;
}



/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 0;
}

img.avatar {
    width: 30%;
    border-radius: 8px;
}

.container {
    padding: 16px;
}


/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 40%; /* Could be more or less, depending on screen size */
}


/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
 
    .cancelbtn {
       width: 100%;
    }
   
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #FFFAFA;
}

li {
    float: left;
}

li a {
    display: block;
    color: black;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
   
}

li a:hover {
    background-color:#FFF5EE;
}


h1 {
    color: green;  text-align: center
}

h2 {
    color: black;  text-align: center
}
select {
    width: 40%;
    padding: 16px 20px;
    border: none;
    border-radius: 4px;
    background-color: #FFFAFA;
}
.button {
    background-color: #87CEFA; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}
.button1 {
    background-color: white; 
    color: black; 
    border: 2px solid #000080;
}

.button1:hover {
    background-color: #87CEFA;
    color: white;
}
img {
    max-width: 100%;
    height: auto;
    display: block;
    margin: auto;
 
}

</style>
<title>Welcome Page</title> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<%@ page import= "AuktionDAO.CategorySerializierung" %>
<%@ page import= "java.util.*" %>
<%@ page import= "beans.Category" %> 
</head>  
<body> 
 <img src="images/logo1.jpg" alt="Mountain View" style="width:auto;height:auto;">
  <ul>
  <li><a href="Registration.jsp">Registration</a></li> 
   <li style="float:right"><button  onclick="document.getElementById('id01').style.display='block'" style="width:auto;" >Login</button>
     <div id="id01" class="modal">
  <form class="modal-content animate"  method="post"  action="LoginServlet">  
    <div class="imgcontainer">
      <img src="images/login1.jpg"  alt="Avatar" class="avatar">
    </div>
    <div class="container">
      <label><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="login" required>

      <label><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required>
      <input type="submit"  class="button button1" value="login"  />
    </div>
    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
        <a href="Registration.jsp" style="color:black">Create account</a>
    </div>
  </form>
 </div>
    |</li>
</ul>
<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<h2>New to EngineSell? Sign up - it's free and simple!</h2> 
<br>
 <h2>Search by Categories</h2>
 <br>
<form method="post" action="SearchByCategory">
  <select id="country" name="category"> 
  <option value="-1">-Select Category-</option>
  <%
CategorySerializierung category=new CategorySerializierung();
ArrayList <Category> categoryList =new ArrayList<Category> ();
categoryList= category.getCategoryList();
for(Category produktSuchen: categoryList){		
%>
   <option value="<%out.print(produktSuchen.getName());%>"><%out.print(produktSuchen.getName());%></option><% }%>
</select>
<input type="submit"  class="button button1" value="Search Product" />
</form>
<body>

<div class="w3-content w3-section" style="max-width:1400px">
  <img class="mySlides" src="images/car.jpg" style="width:100%">
  <img class="mySlides" src="images/jewer.jpg" style="width:100%">
  <img class="mySlides" src="images/coin.jpg" style="width:100%">
   <img class="mySlides" src="images/vase.jpg" style="width:100%">
    <img class="mySlides" src="images/mona.jpg" style="width:100%">
</div>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
</body>  
</html>