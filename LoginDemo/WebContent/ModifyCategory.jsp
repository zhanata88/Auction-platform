<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify Category</title>
<%@ page import= "AuktionDAO.CategorySerializierung" %>
<%@ page import= "java.util.*" %>
<%@ page import= "beans.Category" %>
</head>

<body>
<a href="LogoutServlet">Logout</a>|

<form method="post" action="ModifyCategoryServlet">

<table>

<tr>

<td>Choose a category which you want to modify:</td>

<td><select name="OldName">

<option value="-1">-Select Category-</option>

<% 
CategorySerializierung category=new CategorySerializierung();
ArrayList <Category> categoryList =new ArrayList<Category> ();
categoryList= category.getCategoryList();
for(Category produktSuchen: categoryList){	
	
%>
<option value="<%out.print(produktSuchen.getName());%>"><%out.print(produktSuchen.getName());%></option><% }%>


  </select></td>  
  
  <br>  

        Enter a new name here:<input type="text" name="NewName"><br>   

 
       

<td><input type="submit" value="Modify" /></td>

</tr>

</table>

</form>
 <a href="adminmenu.jsp">Back to menu</a>
</body>

</html>


