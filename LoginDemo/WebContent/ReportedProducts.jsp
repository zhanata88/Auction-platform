<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import= "AuktionDAO.*"%>
<%@ page import= "java.util.*" %>
<%@page import= "beans.*" %>
<%@page import= "java.text.DateFormat" %>
<%@page import= "java.text.SimpleDateFormat" %>
<html>
<head>
<style type="text/css">body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}</style>
<style>

input[type=submit] {
    background-color: #87CEFA;
    border: none;
    color: white;
    padding: 8px 15px;
    text-decoration: none;
    cursor: pointer;  
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul class="zebra">
<% 
ProduktSerializierung produkt=new ProduktSerializierung();
ArrayList <Produkt> produktList1=new ArrayList <Produkt>();
produktList1=produkt.getReportProduktList();
DateFormat df = new SimpleDateFormat("MM/dd/yyyy");

for (int i=0;i<produktList1.size();i++){
	 out.println("<li>"+ "<p>"+"Name of Product: "+produktList1.get(i).getName()+"<br>"+
   		  "Category: "+produktList1.get(i).getCategory()+"<br>"+
   		  "Start price: "+ produktList1.get(i).getStartpreis()+"<br>" +
   		  "Actual price: "+  produktList1.get(i).getAktuelpreis()+"<br>"+
   		  "Description: " + produktList1.get(i).getBeschreibung()+"<br>"+
   		 "Created by user: "+(String)produktList1.get(i).getAuthor()+"<br>"+
   		 "Highest Bid: "+(String)produktList1.get(i).getHighestb()+"<br>"+
   		 "Date of expiration "+df.format(produktList1.get(i).getAblauf())+"</li>"+"</p>");
              
         out.println("<form method="+'"'+"post"+'"'+  " action="+'"'+"DeleteReportedProductServlet"+'"'+'>'+             
                      " <input type=" + '"' + "hidden" + '"'+ " name="+'"' +"object"+'"'+" value= "+ 
         (produktList1.get(i)).getName()+'>'+"<input type="+'"'+"submit"+'"'+" value="+'"'+"Delete"+'"'+'>' +" </form>" +"<br>" );
         
           out.println(" <"+"FORM METHOD=" + '"'+ "POST" + '"' +" ACTION="+'"'+"CancelReportServlet"+ '"'+ '>'+
                          " <input type=" + '"' + "hidden" + '"'+ " name="+'"' +"object2"+'"'+" value= "+
           (produktList1.get(i)).getName()+ '>'  +" <INPUT TYPE=" + '"' + "SUBMIT" + '"'+ " Value="+'"'+ "Cancel" +'"' +'>' +" </form>"+"<br>");}          
          
%>
</ul>
  <a href="adminmenu.jsp">Back to menu</a>
</body>
</html>