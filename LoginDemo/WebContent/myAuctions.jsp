<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import= "AuktionDAO.*"%>
<%@ page import= "java.util.*" %>
<%@page import= "beans.*" %>
<%@page import= "java.text.SimpleDateFormat" %>
<%@page import= "java.text.DateFormat" %>

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
        <a href="LogoutServlet">Logout</a>| <a href="userMenu.jsp">Back to menu</a>

        <ul class="zebra">
        <h2>My Auctions:</h2> 
        <br/><br/>
        <h3>Active: </h3>
        
            <%
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
                String user = String.valueOf(session.getAttribute("name"));
                UserSerializierung u = new UserSerializierung();
                ArrayList<User> us = u.getUserList();

                ProduktSerializierung produkt = new ProduktSerializierung();
                ArrayList<Produkt> produktList = produkt.getProduktList();
                

                //So listet es nur jene produkte auf, die nicht abgelaufen und nicht gelöscht sind
                for (int i = 0; i < us.size(); i++) {
                    if (us.get(i).getLogin().equals(user)) {
                        for (int z = 0; z < us.get(i).eigen.size(); z++) {
                            for (int j = 0; j < produktList.size(); j++) {
                                if (us.get(i).eigen.get(z).getName().equalsIgnoreCase(produktList.get(j).getName())) {
                                    out.println("<li>" + "<p>" + "Name of Product: " + produktList.get(j).getName() + "<br>"
                                            + "Category: " + produktList.get(j).getCategory() + "<br>"
                                            + "Start price: " + produktList.get(j).getStartpreis() + "<br>"
                                            + "Actual price: " + produktList.get(j).getAktuelpreis() + "<br>"
                                            + "Description: " + produktList.get(j).getBeschreibung() + "<br>"
                                            + "Created by user: " + (String) produktList.get(j).getAuthor() + "<br>"
                                            + "Highest Bid: " + (String) produktList.get(j).getHighestb() + "<br>"
                                            + "Date of expiration " + df.format(produktList.get(j).getAblauf()) + "</li>" + "</p>");
                                }
                            }
                        }
                    }
                }


            %>
            <h3>Expired: </h3>
            <%
                           for(int i = 0; i< us.size(); i++){
                    if(us.get(i).getLogin().equals(user))
                         for(int j = 0; j < us.get(i).eigenT.size(); j++)
                             if(us.get(i).eigenT.get(j).getPayed()==1)
                             out.println("<li>"+ "<p>"+"Name of Product: "+ us.get(i).eigenT.get(j).getName()+"<br>"+
                            		 "Category: "+us.get(i).eigenT.get(j).getCategory()+"<br>"+
                            		 "Start price: "+ us.get(i).eigenT.get(j).getStartpreis()+"<br>" +
                            		 "Actual price: "+us.get(i).eigenT.get(j).getAktuelpreis() +"<br>"+
                            		 "Description: " +us.get(i).eigenT.get(j).getBeschreibung() +"<br>"+
                            		 "Created by user: "+(String)us.get(i).eigenT.get(j).getAuthor()+"<br>"+
                            		 "Highest Bid: "+(String)us.get(i).eigenT.get(j).getHighestb()+"<br>"+
                            		 "Date of expiration "+df.format(us.get(i).eigenT.get(j).getAblauf())+
                                         "Payed!"+"</li>"+"</p>"); 
                             else out.println("<li>"+ "<p>"+"Name of Product: "+ us.get(i).eigenT.get(j).getName()+"<br>"+
                            		 "Category: "+us.get(i).eigenT.get(j).getCategory()+"<br>"+
                            		 "Start price: "+ us.get(i).eigenT.get(j).getStartpreis()+"<br>" +
                            		 "Actual price: "+us.get(i).eigenT.get(j).getAktuelpreis() +"<br>"+
                            		 "Description: " +us.get(i).eigenT.get(j).getBeschreibung() +"<br>"+
                            		 "Created by user: "+(String)us.get(i).eigenT.get(j).getAuthor()+"<br>"+
                            		 "Highest Bid: "+(String)us.get(i).eigenT.get(j).getHighestb()+"<br>"+
                            		 "Date of expiration "+df.format(us.get(i).eigenT.get(j).getAblauf())+"</li>"+"</p>"); 
                            		 
                        }

            %>
            
            <h2>My Bids:</h2> 
            <br/><br/>
            <h3>Active: </h3>
            <%   
                //So listet es nur jene produkte auf, die nicht abgelaufen und nicht gelöscht sind
 
                for (int i = 0; i < us.size(); i++) {
                    if (us.get(i).getLogin().equals(user)) {
                        for (int z = 0; z < us.get(i).bids.size(); z++) {
                            for (int j = 0; j < produktList.size(); j++) {
                                if (us.get(i).bids.get(z).getName().equalsIgnoreCase(produktList.get(j).getName())) {
                                    out.println("<li>" + "<p>" + "Name of Product: " + produktList.get(j).getName() + "<br>"
                                            + "Category: " + produktList.get(j).getCategory() + "<br>"
                                            + "Start price: " + produktList.get(j).getStartpreis() + "<br>"
                                            + "Actual price: " + produktList.get(j).getAktuelpreis() + "<br>"
                                            + "Description: " + produktList.get(j).getBeschreibung() + "<br>"
                                            + "Created by user: " + (String) produktList.get(j).getAuthor() + "<br>"
                                            + "Highest Bid: " + (String) produktList.get(j).getHighestb() + "<br>"
                                            + "Date of expiration " + df.format(produktList.get(j).getAblauf()) + "</li>" + "</p>");
                                }
                            }
                        }
                    }
                }


            %>
            
                        <h3>Expired: </h3>
            <%
                           for(int i = 0; i< us.size(); i++){
                    if(us.get(i).getLogin().equals(user))
                         for(int j = 0; j < us.get(i).bidsT.size(); j++)
                             if(us.get(i).bidsT.get(j).getPayed()==1)

                             out.println("<li>"+ "<p>"+"Name of Product: "+ us.get(i).bidsT.get(j).getName()+"<br>"+
                            		 "Category: "+us.get(i).bidsT.get(j).getCategory()+"<br>"+
                            		 "Start price: "+ us.get(i).bidsT.get(j).getStartpreis()+"<br>" +
                            		 "Actual price: "+us.get(i).bidsT.get(j).getAktuelpreis() +"<br>"+
                            		 "Description: " +us.get(i).bidsT.get(j).getBeschreibung() +"<br>"+
                            		 "Created by user: "+(String)us.get(i).bidsT.get(j).getAuthor()+"<br>"+
                            		 "Highest Bid: "+(String)us.get(i).bidsT.get(j).getHighestb()+"<br>"+
                            		 "Date of expiration "+df.format(us.get(i).bidsT.get(j).getAblauf())+"</li>"+
                                         "Payed! "+
                                         "<form action=" + '"' + "rate.jsp" + '"' + ">"+ 
                                         " <input type=" + '"' + "hidden" + '"'+ " name="+'"' +"username"+'"'+" value="+'"'+(String)us.get(i).bidsT.get(j).getAuthor() +'"'+'>'+
                                         "<input type=" + '"' + "submit" + '"' + " value=" + '"' + "Rate" + '"' + " /> </form>"+"</p>");
                             else out.println("<li>"+ "<p>"+"Name of Product: "+ us.get(i).bidsT.get(j).getName()+"<br>"+
                            		 "Category: "+us.get(i).bidsT.get(j).getCategory()+"<br>"+
                            		 "Start price: "+ us.get(i).bidsT.get(j).getStartpreis()+"<br>" +
                            		 "Actual price: "+us.get(i).bidsT.get(j).getAktuelpreis() +"<br>"+
                            		 "Description: " +us.get(i).bidsT.get(j).getBeschreibung() +"<br>"+
                            		 "Created by user: "+(String)us.get(i).bidsT.get(j).getAuthor()+"<br>"+
                            		 "Highest Bid: "+(String)us.get(i).bidsT.get(j).getHighestb()+"<br>"+
                            		 "Date of expiration "+df.format(us.get(i).bidsT.get(j).getAblauf())+"</li>"+
                                         "<form action=" + '"' + "pay.jsp" + '"' +">"+ 
                                         " <input type=" + '"' + "hidden" + '"'+ " name="+'"' +"produktname"+'"'+" value="+'"'+(String)us.get(i).bidsT.get(j).getName() +'"'+'>'+
                                     " <input type=" + '"' + "hidden" + '"'+ " name="+'"' +"author"+'"'+" value="+'"'+(String)us.get(i).bidsT.get(j).getAuthor() +'"'+'>'+
                                     " <input type=" + '"' + "hidden" + '"'+ " name="+'"' +"bidder"+'"'+" value="+'"'+(String)us.get(i).bidsT.get(j).getHighestb() +'"'+'>'+
                                         "<input type=" + '"' + "submit" + '"' + " value=" + '"' + "Pay" + '"' + " />"+"</form>"+
                                         "<form action=" + '"' + "rate.jsp" + '"' + ">"+ 
                                         " <input type=" + '"' + "hidden" + '"'+ " name="+'"' +"username"+'"'+" value="+'"'+(String)us.get(i).bidsT.get(j).getAuthor() +'"'+'>'+
                                         "<input type=" + '"' + "submit" + '"' + " value=" + '"' + "Rate" + '"' + " /> </form>"+"</p>");	 
                            		 
                        }

            %>
        </ul> 
    </body>

