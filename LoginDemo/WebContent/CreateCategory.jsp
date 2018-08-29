

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
       <style type="text/css">body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}</style>
<style>
form {
    border: 3px solid #000080;
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
    background-color: #87CEFA;
    color: white;
    padding: 10px 18px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 20%;

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
     align: bottom;
}






/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  
    .cancelbtn {
       width: 100%;
    }
}
</style>
<body>
<h1 align="center" style="color:Black">Create New Category</h1>

 <form method="post"  action="CategoryServlet">   
  <div class="container">
    <label><b><font face="Comic sans MS" size="5">Enter Category Name here</font></b></label><br>
    
    <input type="text"  name="categoryname" required><br>
    
      
   <input type="submit"  class="button button1" value="Create" />
   
  </div>

  
  <a href="adminmenu.jsp">
   <p align="right"> 
    <button type="button" class="cancelbtn">Back to menu</button></a>
    </p>
  </div>
</form>
</body>
</html>








       