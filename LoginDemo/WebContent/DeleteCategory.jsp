<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Search Product by Category</title>
<%@ page import= "AuktionDAO.CategorySerializierung" %>
<%@ page import= "java.util.*" %>
<%@ page import= "beans.Category" %>
</head>

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
    color: #87CEFA;  text-align: center;
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


 select {
       border: 0 none;
    color: black;
    background: #87CEFA;
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
    background: #4CAF50;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  
    .cancelbtn {
       width: 100%;
    }
}
</style>
<body>
<a align="top" href="LogoutServlet">Logout</a>|
<h1 align="center" style="color:Black">Delete Category</h1>

 <form method="post"  action="DeleteCategoryServlet">   
  <select id="country" name="categoryName"> 
  <option value="-1">-Select Category-</option>
  <%
CategorySerializierung category=new CategorySerializierung();
ArrayList <Category> categoryList =new ArrayList<Category> ();
categoryList= category.getCategoryList();
for(Category produktSuchen: categoryList){		
%>
   <option value="<%out.print(produktSuchen.getName());%>"><%out.print(produktSuchen.getName());%></option><% }%>
</select>

  <input type="submit"  class="button button1" value="Delete" />


 <br> <br> <br> <br> <br> <br> <br> <br>
  <a href="adminmenu.jsp" align="right">
  
    <button type="button" class="cancelbtn">Back to menu</button></a>
    
 
</form>
</body>
</html>









