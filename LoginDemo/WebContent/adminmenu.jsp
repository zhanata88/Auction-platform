
        <%@ page import= "java.util.*" %>
        <%@ page import= "beans.*" %> 
        <%@ page import= "AuktionDAO.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <style type="text/css">body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}</style>
     <style>
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
    background-color: #FFF5EE;
}


h1 {
    color: green;  text-align: center
}

h2 {
    color: black;  text-align: center
}

</style>
<title>Welcome AdminPage</title> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
</head>  
<body> 
 <img src="images/logo1.jpg" alt="Mountain View" style="width:auto;height:auto;"> 
<h2>Admin menu</h2> 
  <ul>
  <li><a href="CreateCategory.jsp">Create Category</a></li> 
   <li><a href="DeleteCategory.jsp">Delete Category</a></li> 
    <li><a href="ModifyCategory.jsp">Modify Category</a></li> 
     <li><a href="deleteuser.jsp">Delete User</a></li> 
      <li><a href="SearchByCategoryAdmin.jsp">Search by Category</a></li> 
        <li><a href="ReportedProducts.jsp">Reported products</a></li> 
      <li> <a href="LogoutServlet" >Logout</a></li>
      
   
</ul>
<br><br><br>
<br>

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
    
    
    
    
    
    
    
        