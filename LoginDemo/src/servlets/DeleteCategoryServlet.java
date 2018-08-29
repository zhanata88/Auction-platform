package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.Category;
import management.CategoryManagement;


@WebServlet(name="DeleteCategoryServlet",urlPatterns={"/DeleteCategoryServlet"})
public class DeleteCategoryServlet extends HttpServlet {
    	private static final long serialVersionUID = 1L;

    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		 
   	        PrintWriter out=response.getWriter();  
   	   
   	     	 String name=request.getParameter("categoryName");
                    CategoryManagement c = new CategoryManagement();
                    Category cat = new Category(name);
                    c.deleteCategory(cat);
                    response.setContentType( "text/html" );
                    response.sendRedirect( "adminmenu.jsp?foo="+name ); 
                 
                  
   }
   }
