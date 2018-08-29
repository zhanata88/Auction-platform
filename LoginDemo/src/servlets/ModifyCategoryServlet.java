package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import management.CategoryManagement;


@WebServlet(name="ModifyCategoryServlet",urlPatterns={"/ModifyCategoryServlet"})
public class ModifyCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();  
	   
	     	 String Name=request.getParameter("NewName");  
	        String cat=request.getParameter("OldName"); 
	        
	        CategoryManagement c = new CategoryManagement();
	        c.modifyCategory(cat, Name);
	        response.setContentType( "text/html" );
            response.sendRedirect( "adminmenu.jsp"); 
         
          
}
	
	
	
	
	}