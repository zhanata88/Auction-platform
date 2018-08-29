
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import AuktionDAO.UserSerializierung;
import java.util.*;
import beans.*;
@WebServlet(name="DeleteUServlet",urlPatterns={"/DeleteUServlet"})

public class DeleteUServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();  
	   
	     	 String name=request.getParameter("username");
	     	UserSerializierung u=new UserSerializierung();
    ArrayList <User> userList=new ArrayList <User>();
    userList=u.getUserList();
    for (int i=0;i<userList.size();i++){
    if(name.equals(((userList.get(i)).getLogin()))){u.deleteUser(userList.get(i));}
    }
            RequestDispatcher view = request.getRequestDispatcher("deleteuser.jsp");
		     		view.forward(request, response);

}
}
