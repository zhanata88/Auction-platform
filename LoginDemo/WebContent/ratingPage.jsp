
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import= "AuktionDAO.*"%>
<%@ page import= "java.util.*" %>
<%@page import= "java.util.Date" %>
<%@page import= "beans.*" %>
<%@page import= "java.text.SimpleDateFormat" %>
<%@page import= "java.text.DateFormat" %>
<%@page import= "java.text.*" %>


<html>
    <head>
        <style type="text/css">body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}</style>
        <style> 
            select {
                width: 40%;
                padding: 16px 20px;
                border: none;
                border-radius: 4px;
                background-color: #CFCFCF;
            }
            .button {
                background-color: #87CEFA;/* Green */
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
            input[type=submit] {
                background-color: #87CEFA;
                border: none;
                color: white;
                padding: 8px 15px;
                text-decoration: none;
                cursor: pointer;

            }

            input[type=text] {
                width: 250px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 30px;
                background-color: white;

            }
            .inputsearch[type=text]{
                background-image: url('./images/search.png');
                background-position: 10px 10px; 
                background-repeat: no-repeat;
                padding: 12px 20px 12px 40px;
                -webkit-transition: width 0.4s ease-in-out;
                transition: width 0.4s ease-in-out;

            }

            .inputsearch[type=text]:focus {
                width: 100%;
            }
            .zebra {
                list-style: none;
                border-left: 10px solid #FC7574;
                padding: 0;
                font-family: "Lucida Sans";
            }
            .zebra li {
                padding: 10px;
            }
            .zebra li:nth-child(odd) {
                background: #E1F1FF;
            }
            .zebra li:nth-child(even) {
                background: white;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title><%out.println(request.getParameter("username"));%></title>
    </head>
    <body>
       
        
        
        
        
        <a href="LogoutServlet">Logout</a>|

        </form>
        <br/><br/>
        <ul class="zebra">
        <%
            String name=request.getParameter("username");
            UserSerializierung us = new UserSerializierung();
            ArrayList<User> userList = us.getUserList();
            DecimalFormatSymbols otherSymbols = new DecimalFormatSymbols();
            otherSymbols.setDecimalSeparator('.');
             DecimalFormat formatter = new DecimalFormat("0.00", otherSymbols);      
            for(int i =0; i< userList.size(); i++){
                if(name.equals(userList.get(i).getLogin())){
                    out.println("<li>" +"<p>" +" Average Rating: "+formatter.format(userList.get(i).avrgrating)+"<br>"+"</li>"+"</p>");
                    for(int j =(userList.get(i).rating.size())-1; j >=0; j--){
                        out.println("<li>" +"<p>" +"Rating: "+userList.get(i).rating.get(j).getA()+"<br>");
                        out.println("Comment: "+userList.get(i).rating.get(j).getComment()+"<br>"+"</li>"+"</p>");
                    }
                }
                    
            }

        %>
        </ul>
         <a href="userMenu.jsp">Back to menu</a>

    </body>