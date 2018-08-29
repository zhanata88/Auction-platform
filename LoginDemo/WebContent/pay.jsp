
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import= "AuktionDAO.CategorySerializierung" %>
<%@ page import= "java.util.*" %>
<%@ page import= "beans.Category" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<style
type="text/css">
body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}</style>
<style>
form {
    border: 3px solid #000080;
}

select {
       border: 0 none;
    color: white;
    background: black;
    font-size: 20px;
    font-weight: bold;
    padding: 2px 10px;
    width: 378px;
    
}
#mainselection {
    overflow: hidden;
    width: 350px;
    -moz-border-radius: 9px 9px 9px 9px;
    -webkit-border-radius: 9px 9px 9px 9px;
    border-radius: 9px 9px 9px 9px;
    box-shadow: 1px 1px 11px #330033;
    background: #87CEFA;
}
    
    
input[type=text], input[type=password]{
    width: 60%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
h1 {
    color: green;  text-align: center;
}
button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 18px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 30%;

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

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
    
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  
   
}
</style>
<body>
<h1 align="center" style="color:Black"><font face="Comic sans MS" size="5">Pay here</font></h1>
<form method="post"  action="payServlet"> 
<div class="container">
    <label><b> Address: </b></label><br>
    
    <input type="text" placeholder="Enter address" name="address" required><br>
    
    <label><b>Payment Info:</b></label><br>
    
    <input type="text" placeholder="Enter Card Number" name="info" required><br>
        <input type="text" placeholder="Enter Security Code" name="info1" required><br>
    <input type="text" placeholder="Enter Expiration Month" name="info2" required><br>
    <input type="text" placeholder="Enter Expiration Year" name="info3" required><br>
    <input type="hidden" name="produktname" value="<% out.println(request.getParameter("produktname"));%>">
    <input type="hidden" name="author" value="<% out.println(request.getParameter("author"));%>">
    <input type="hidden" name="bidder" value="<% out.println(request.getParameter("bidder"));%>">

   
 


  
   <input type="submit"  class="button button1" value="Post!" />
   
  </div>
   <div class="container" style="background-color:#f1f1f1">
  <a href="userMenu.jsp">
   <p align="right"> 
    <button type="button" class="cancelbtn">Cancel</button></a>
    </p>
  </div>
</form>
</body>
</html>





 
        
      