package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import management.UserManagement;


@WebServlet(name="LoginServlet",urlPatterns={"/LoginServlet"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 UserManagement user=new UserManagement();
		response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();  
	   
	     	 String login=request.getParameter("login");  
	        String password=request.getParameter("password"); 
	        
	        if(user.checkLoginAdmin(login, password)){
	        	 HttpSession session=request.getSession();  
	     	      session.setAttribute("adminName",login); 
	        	 out.print("Welcome   -  "+login);
	        	 request.getRequestDispatcher("adminmenu.jsp").include(request, response);
	        }
	        else
	        	if(user.checkLoginForscher(login, password)){
		        	 HttpSession session=request.getSession();  
		     	      session.setAttribute("forscherName",login); 
		        	 out.print("Welcome,  -  "+login);
		        	 request.getRequestDispatcher("forscherMenu.jsp").include(request, response);
		        }
	        	else
	        
	        	if(user.checkLoginUser(login, password)){
	        		HttpSession session=request.getSession();  
		     	      session.setAttribute("name",login); 
		     	  
		     	    request.getRequestDispatcher("userMenu.jsp").include(request, response);
	        	}
	        	else
	        	{out.print(  "Sorry, username or password is false!");  
	        	 request.getRequestDispatcher("Login.jsp").include(request, response);
	        		
	        	}
	        	
	        
	        out.close(); }
	}