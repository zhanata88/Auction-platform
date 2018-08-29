
package servlets;

import AuktionDAO.ProduktSerializierung;
import AuktionDAO.UserSerializierung;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import beans.*;
@WebServlet(name="payServlet",urlPatterns={"/payServlet"})

public class payServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();  
	   
	     	 String name=request.getParameter("produktname");
                 String author = request.getParameter("author");
                 String bidder = request.getParameter("bidder");
                  name= name.trim();
                   author=author.trim();
                   bidder=bidder.trim();
	     	
    UserSerializierung l=new UserSerializierung();
    ArrayList <User> userList=new ArrayList <User>();
    userList=l.getUserList();
    for (int i=0;i<userList.size();i++){
    if(author.equals(((userList.get(i)).getName()))){
        for(int j =0; j< userList.get(i).eigenT.size();j++) 
            if(userList.get(i).eigenT.get(j).getName().equals(name)){userList.get(i).eigenT.get(j).setPayed(1);l.save();}
    
    }
     if(bidder.equals(((userList.get(i)).getName()))){
        for(int j =0; j< userList.get(i).bidsT.size();j++) 
            if(userList.get(i).bidsT.get(j).getName().equals(name)){userList.get(i).bidsT.get(j).setPayed(1);l.save();}
    
    }
    }
            RequestDispatcher view = request.getRequestDispatcher("myAuctions.jsp");
		     		view.forward(request, response);

}
}
