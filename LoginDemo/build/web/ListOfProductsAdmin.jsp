
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import= "AuktionDAO.*"%>
<%@ page import= "java.util.*" %>
<%@page import= "java.util.Date" %>
<%@page import= "java.text.SimpleDateFormat" %>
<%@page import= "java.text.DateFormat" %>
<%@page import= "beans.*" %>
<html>
<head>

<style type="text/css">body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}</style>
 <style> 
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
<title>The list of Products</title>
</head>


<body>

<br/><br/>

    

<br/><br/>

 <ul class="zebra">
<% String list = request.getParameter("foo");;
ProduktSerializierung produkt=new ProduktSerializierung();
ArrayList <Produkt> produktList=new ArrayList <Produkt>();
produktList=produkt.groupByCategory(list);
DateFormat df = new SimpleDateFormat("MM/dd/yyyy");

for (int i=0;i<produktList.size();i++)
          {
              
                                     //Prüfen ob Zeit abgelaufen ist
                    Date now = new Date(System.currentTimeMillis());
                    if (produktList.get(i).getAblauf().before(now)) {

                        UserSerializierung u = new UserSerializierung();
                        ArrayList<User> us = u.getUserList();

                        String user = new String(produktList.get(i).getAuthor());
                        for (int j = 0; j < us.size(); j++) {
                            if (us.get(j).getLogin().equals(user)) {
                                us.get(j).eigenT.add(produktList.get(i));
                                u.save();
                            }
                        }

                        
                        
                        
                        if (produktList.get(i).getHighestb() != null) {
                            String user1 = new String(produktList.get(i).getHighestb());
                            for (int j = 0; j < us.size(); j++) {
                                if (us.get(j).getLogin().equals(user1)) {
                                    us.get(j).bidsT.add(produktList.get(i));
                                    u.save();
                                }
                            }
                        }
                        
                        
                        produkt.deleteProdukt(produktList.get(i));
                        produkt.save();
                    }
                    

              out.println("<li>"+ "<p>"+"Name of Product: "+produktList.get(i).getName()+"<br>"+
            		  "Category: "+produktList.get(i).getCategory()+"<br>"+
            		  "Start price: "+ produktList.get(i).getStartpreis()+"<br>" +
            		  "Actual price: "+  produktList.get(i).getAktuelpreis()+"<br>"+
            		  "Description: " + produktList.get(i).getBeschreibung()+"<br>"+
            		 "Created by user: "+(String)produktList.get(i).getAuthor()+"<br>"+
            		 "Highest Bid: "+(String)produktList.get(i).getHighestb()+"<br>"+
            		 "Date of expiration "+df.format(produktList.get(i).getAblauf())+"</li>"+"</p>");


              out.println(produktList.get(i)+"  Created by user: "+(String)produktList.get(i).getAuthor()+"<br>");
                  out.println("<form method="+'"'+"post"+'"'+  " action="+'"'+"DeleteProductServlet"+'"'+'>'+  
                     
                            " <input type=" + '"' + "hidden" + '"'+ " name="+'"' +"object"+'"'+" value= "+ (produktList.get(i)).getName()+'>'+
                   "<input type="+'"'+"submit"+'"'+" value="+'"'+"Delete"+'"'+'>'+"<br>");     
          
          }

%>
  <a href="adminmenu.jsp">Back to menu</a>
  </ul>
</body>
</html>