package servlets;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
	import javax.servlet.http.HttpServletRequest;  
	import javax.servlet.http.HttpServletResponse;

import beans.Produkt;
import management.ProduktManagement;  
@WebServlet(name="SortedByKeyword",urlPatterns={"/SortedByKeyword"})
	public class SortedByKeyword extends HttpServlet {  
	    /**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response)  
                throws ServletException, IOException {    
     
      
    String name=request.getParameter("keyword");
    name.trim();
   
    response.setContentType( "text/html" );
    response.sendRedirect( "SortedByKeyword.jsp?foo="+name ); 
    
   
       
    }  
    
}  
 