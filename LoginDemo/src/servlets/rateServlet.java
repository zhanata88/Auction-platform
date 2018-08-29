package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.*;
import AuktionDAO.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import management.UserManagement;

@WebServlet(name = "rateServlet", urlPatterns = {"/rateServlet"})
public class rateServlet extends HttpServlet {

    private static final long serialVersionUID = 102831973239L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        String user = request.getParameter("user");
        double ratev = Double.parseDouble(request.getParameter("ratev"));
        String com = request.getParameter("com");
        com = com.trim();
        user = user.trim();
        UserSerializierung u = new UserSerializierung();
        ArrayList<User> us = u.getUserList();
        Rating rate = new Rating(ratev, com);
        for (int i = 0; i < us.size(); i++) {
            if (us.get(i).getLogin().equals(user)) {
                u.addRating(us.get(i), rate);
            }
        }
        
    

    out.print ("your Rating is successfully posted ");
    request.getRequestDispatcher ("userMenu.jsp").include(request, response);
    }                                              
}

