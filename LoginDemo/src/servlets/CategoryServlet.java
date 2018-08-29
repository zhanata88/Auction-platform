

package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.Category;
import management.CategoryManagement;


@WebServlet(name="CategoryServlet",urlPatterns={"/CategoryServlet"})
public class CategoryServlet extends HttpServlet {
    	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();  
	   
	     	 String name=request.getParameter("categoryname");
	     	 if (name!=null){
                 CategoryManagement c = new CategoryManagement();
                 Category a = new Category(name);
                 c.saveCategory(a);
                RequestDispatcher view = request.getRequestDispatcher("adminmenu.jsp");
		     		view.forward(request, response);}
	     	else{  
	            out.print("Enter a category name!");  
	            request.getRequestDispatcher("CreateCategory.jsp").include(request, response);  
	        } 
}
}
