
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import= "AuktionDAO.*"%>
<%@ page import= "java.util.*" %>
<%@page import= "beans.*" %>
<html>
    <head>
    <style type="text/css">
  body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}

.border {
list-style: none;
padding: 0;
}
.border li {
font-family: "Trebuchet MS", "Lucida Sans";
padding: 7px 20px;
margin-bottom: 10px;
border-radius: 5px;
border-left: 10px solid #f05d22; 
box-shadow: 2px -2px 5px 0 rgba(0,0,0,.1),
     -2px -2px 5px 0 rgba(0,0,0,.1),
    2px 2px 5px 0 rgba(0,0,0,.1),
    -2px 2px 5px 0 rgba(0,0,0,.1);
font-size: 20px;
letter-spacing: 2px;
transition: 0.3s all linear;
background: white;
 width: 80%;
 text-align: center;
}
.border li:nth-child(2){border-color: #8bc63e;}
.border li:nth-child(3){border-color: #fcba30;}
.border li:nth-child(4){border-color: #1ccfc9;}
.border li:nth-child(5){border-color: #493224;}
.border li:hover {
border-left: 10px solid transparent;
}
.border li:nth-child(1):hover {
border-right: 10px solid #f05d22;
}
.border li:nth-child(2):hover {
border-right: 10px solid #8bc63e;
}
.border li:nth-child(3):hover {
border-right: 10px solid #fcba30;
}
.border li:nth-child(4):hover {
border-right: 10px solid #1ccfc9;
}
.border li:nth-child(5):hover {
border-right: 10px solid #493224;
}
 input[type=submit] {
    background-color: #87CEFA;
    border: none;
    color: white;
    padding: 6px 15px;
    text-decoration: none;
    cursor: pointer;
    
}
div {
    background-color: #87CEFA;
    width: 500px;
    border: 5px solid DarkBlue;
    padding: 20px;
   margin: auto;
    align:center;
}

</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <br>
    <br>
    
        <h1>User List</h1>
<br>
<div>
 <ul class="border">
 
<% String list =(String)request.getAttribute("name");
UserSerializierung u=new UserSerializierung();
ArrayList <User> userList=new ArrayList <User>();
userList=u.getUserList();

for (int i=0;i<userList.size();i++)
          {

              
              out.print("<li>"+(userList.get(i)).getLogin()  );
             
              out.print(" <"+"FORM METHOD=" + '"'+ "POST" + '"' +" ACTION="+'"'+"ratingPage.jsp"+ '"'+ '>'+ 
                      " <input type=" + '"' + "hidden" + '"'+ " name="+'"' +"username"+'"'+" value="+'"'+(userList.get(i)).getLogin() +'"'+'>'
                      
                      +  "<input type="+'"'+"submit"+'"'+" value="+'"'+"View Rating"+'"'+'>'+ "</form>"  +"</li>"  );
          
          }

%>

</ul>
</div>
 <a href="userMenu.jsp">Back to menu</a>
    </body>
   
</html>
