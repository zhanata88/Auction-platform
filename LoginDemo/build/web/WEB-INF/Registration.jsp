<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}</style>

<style>
form {
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password]{
    width: 40%;
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
    background-color: #FFF5EE;
    color: white;
    padding: 10px 18px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 30%;

}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
    
}


.container {
    padding: 16px;
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

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  
    .cancelbtn {
       width: 100%;
    }
}
</style>
<body>
<h1 align="center" style="color:Black">Create Your EngineSell Account</h1>

<form method="post"  action="RegistrationServlet">  
  <div class="container">
    <label><b>Name</b></label><br>
    
    <input type="text" placeholder="Enter name" name="Name" required><br>
    
    <label><b>Surname</b></label><br>
    
    <input type="text" placeholder="Enter surname" name="Surname" required><br>
    
     <label><b>Login</b></label><br>
    
    <input type="text" placeholder="Enter login" name="Username" required><br>
    
     <label><b>Password</b></label><br>
    
    <input type="password" placeholder="Enter password" name="UserPassword" required><br>
    
     <label><b>Gender</b></label><br>
    
    <input type="Radio" name="gender"  Value="Male">Male<br>
    <input type="Radio" name="gender"  Value="Female">Female<br><br>
    
     <label><b>Tel. Number</b></label><br>
    
    <input type="text" placeholder="Enter telephone number" name="Telephon Number" required><br>
    
    <label><b>E-mail</b></label><br>
    
    <input type="text" placeholder="Enter e-mail" name="Email" required><br>
    
    <input type="submit"  class="button button1" value="Register" />
      
</div>

  <div class="container" style="background-color:#f1f1f1">
  <a href="index.jsp">
   <p align="right"> 
    <button type="button" class="cancelbtn">Cancel</button></a>
    </p>
  </div>
</form>
</body>
</html>


