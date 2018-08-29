package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AuktionDAO.ProduktSerializierung;
import beans.Produkt;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html"); 
	PrintWriter out=response.getWriter();  
    
    HttpSession session=request.getSession();  
    
    if ((session.getAttribute("name") != null))
    {
     
 	 String name=request.getParameter("object2");
         ProduktSerializierung p = new ProduktSerializierung();
         ArrayList<Produkt> a = p.getProduktList();
         for(int i=0; i<a.size(); i++){
            if(name.equals(a.get(i).getName())){
         p.saveReport(a.get(i));}}
         RequestDispatcher view = request.getRequestDispatcher("userMenu.jsp");
          view.forward(request, response);              
         out.print("reported ");
                       
                         }
        
    
    else
    {  
        out.print("Please login first");  
      
    }  
    
        }

}
