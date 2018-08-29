<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import= "AuktionDAO.*"%>
<%@ page import= "java.util.*" %>
<%@page import= "java.util.Date" %>
<%@page import= "beans.*" %>
<%@page import= "management.*" %>
<%@page import= "java.text.SimpleDateFormat" %>
<%@page import= "java.text.DateFormat" %>

<html>
<head>
<style type="text/css">body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}</style>
  <style>
ul.a {
    list-style-type: circle;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>The list of products</title>
</head>
<body>
<a href="LogoutServlet">Logout</a>| <a href="userMenu.jsp">Back to menu</a>

<ul class="a">
<%@ page import= "AuktionDAO.*"%>
<%@ page import= "java.util.*" %>
<%
String lis = request.getParameter("foo");
ProduktManagement object = new ProduktManagement();
ArrayList<Produkt> list =new ArrayList<Produkt>();
lis.trim();
list=object.getProduktbyName(lis);
ProduktSerializierung produkt=new ProduktSerializierung();
ArrayList <Produkt> produktList=new ArrayList();
produktList=object.getProduktbyName(lis);
DateFormat df = new SimpleDateFormat("MM/dd/yyyy");

for (int i=0;i<produktList.size();i++)
          {

              out.println("<li>"+ "<p>"+"Name of Product: "+produktList.get(i).getName()+"<br>"+
            		  "Category: "+produktList.get(i).getCategory()+"<br>"+
            		  "Start price: "+ produktList.get(i).getStartpreis()+"<br>" +
            		  "Actual price: "+  produktList.get(i).getAktuelpreis()+"<br>"+
            		  "Description: " + produktList.get(i).getBeschreibung()+"<br>"+
            		 "Created by user: "+(String)produktList.get(i).getAuthor()+"<br>"+
            		 "Highest Bid: "+(String)produktList.get(i).getHighestb()+"<br>"+
            		 "Date of expiration "+df.format(produktList.get(i).getAblauf())+"</li>"+"</p>");
              
                  out.println("<form method="+'"'+"post"+'"'+  "action="+'"'+"PlaceBidServlet"+'"'+'>'+  
                   "New Price:<input type="+'"'+"text"+'"'+" name="+'"'+"bidvalue"+'"'+">"+  
                            " <input type=" + '"' + "hidden" + '"'+ " name="+'"' +"object"+'"'+" value= "+ (produktList.get(i)).getName()+'>'+  
                            " <input type=" + '"' + "hidden" + '"'+ " name="+'"' +"user"+'"'+" value= "+ (session.getAttribute("name"))+'>'+
                   "<input type="+'"'+"submit"+'"'+" value="+'"'+"Bid"+'"'+'>' +" </form>"  );  

          
          out.println(" <"+"FORM METHOD=" + '"'+ "POST" + '"' +" ACTION="+'"'+"ReportServlet"+ '"'+ '>'+
                            " <input type=" + '"' + "hidden" + '"'+ " name="+'"' +"object2"+'"'+" value= "+ (produktList.get(i)).getName()+ '>'
                          
                              +" <INPUT TYPE=" + '"' + "SUBMIT" + '"'+ " Value="+'"'+ "Report" +'"'     +'>'      +" </form>"           );}
               
%>
</ul>
</body>
</html>