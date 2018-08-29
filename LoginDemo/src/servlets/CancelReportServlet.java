package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AuktionDAO.ProduktSerializierung;
import beans.Produkt;

/**
 * Servlet implementation class CancelReportServlet
 */
@WebServlet("/CancelReportServlet")
public class CancelReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("object2");
		 ProduktSerializierung u=new ProduktSerializierung();
		 ArrayList<Produkt> produktList1=new ArrayList<Produkt>();
		    produktList1=u.getReportProduktList();
		    for (int i=0;i<produktList1.size();i++){
		    if(name.equals(((produktList1.get(i)).getName()))){
		    	u.deleteReport(produktList1.get(i));
		    	}
		    }
		            RequestDispatcher view = request.getRequestDispatcher("ReportedProducts.jsp");
				     		view.forward(request, response);
		}
	
	}


