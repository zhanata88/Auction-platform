<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}</style>
 <style>

form {
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
h1 {
    color: #87CEFA;  text-align: center;
}
button {
    background-color: #87CEFA;
    color: white;
    padding: 14px 20px;
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

.regbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #87CEFA;
    float:right;
}

.imgcontainer {

    text-align: center;
    margin:  0 auto;
}

img.avatar {
    width: 50%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}



/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  
    .cancelbtn {
       width: 100%;
    }
}
</style>
<body>
<h2>EngineSell.com</h2>

<form method="post"  action="LoginServlet">  
<div class="imgcontainer">
    <img src="images/login1.jpg" alt="Avatar" >
  </div>
  <div class="container">
    <label><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="login" required><br>
    
    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required><br>
        
    <button type="submit">Login</button>
    
  </div>

  <div class="container" style="background-color:#f1f1f1">
  <a href="index.jsp">
    <button type="button" class="cancelbtn">Cancel</button></a>
    
  <a href="Registration.jsp">
    <button type="button" class="regbtn">Registration</button></a>
  </div>
</form>
</body>
</html>