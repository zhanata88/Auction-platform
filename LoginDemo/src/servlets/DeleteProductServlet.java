
package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import AuktionDAO.CategorySerializierung;
import AuktionDAO.*;
import beans.Category;
import java.util.*;
import beans.*;

@WebServlet(name="DeleteProductServlet",urlPatterns={"/DeleteProductServlet"})
public class DeleteProductServlet extends HttpServlet{

 private static final long serialVersionUID = 1515115L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
            
            		 response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();  
	   
	     	 String name=request.getParameter("object");
    ProduktSerializierung u=new ProduktSerializierung();
    ArrayList<Produkt> produktList=new ArrayList();
    produktList=u.getProduktList();
    for (int i=0;i<produktList.size();i++){
    if(name.equals(((produktList.get(i)).getName()))){u.deleteProdukt(produktList.get(i));}
    }
            RequestDispatcher view = request.getRequestDispatcher("SearchByCategoryAdmin.jsp");
		     		view.forward(request, response);
            
            
            
}}
