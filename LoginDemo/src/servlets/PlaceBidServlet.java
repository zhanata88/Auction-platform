
package servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AuktionDAO.*;
import beans.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
@WebServlet(name="PlaceBidServlet",urlPatterns={"/PlaceBidServlet"})


public class PlaceBidServlet extends HttpServlet{
            	private static final long serialVersionUID = 1027733239L;
                protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();  
	        
	        HttpSession session=request.getSession();  
	        
	        if ((session.getAttribute("name") != null))
	        {
	   
                 Double newprice=  Double.parseDouble(request.getParameter("bidvalue"));
	     	 String name=request.getParameter("object");
                 String user = request.getParameter("user");
                 user = user.trim();
                 ProduktSerializierung p = new ProduktSerializierung();
                 ArrayList<Produkt> a = p.getProduktList();
                 Produkt produkt; 
                 for(int i=0; i<a.size(); i++){
                    if(name.equals(a.get(i).getName())){
                        if(newprice > a.get(i).getAktuelpreis()){
                            a.get(i).setAktuelpreis(newprice);
                            a.get(i).setHighestb(user);
                            produkt = a.get(i);
                            p.save();
                            UserSerializierung u = new UserSerializierung();
                  ArrayList<User> us = u.getUserList();
                 for(int k = 0; k< us.size(); k++){
                     if(us.get(k).getLogin().equals(user)){
                         us.get(k).bids.add(produkt);
                         u.save();}
                 }
                        }
                    }
                        
                    }
                 
                 
                                 RequestDispatcher view = request.getRequestDispatcher("userMenu.jsp");
		     		             view.forward(request, response);
                }
	        
	        else
	        {  
	            out.print("Please login first");  
	          
	        }  
	        
                }

}
