package servlets;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.*;
import AuktionDAO.*;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "SearchByCategory", urlPatterns = {"/SearchByCategory"})
public class SearchByCategory extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("category");
        //Prüfen ob Zeit abgelaufen ist

        ProduktSerializierung produkt = new ProduktSerializierung();
        ArrayList<Produkt> produktList = produkt.getProduktList();
        Date now = new Date(System.currentTimeMillis());
        for (int i = 0; i < produktList.size(); i++) {
            if (produktList.get(i).getAblauf().before(now)) {

                UserSerializierung u = new UserSerializierung();
                ArrayList<User> us = u.getUserList();

                String user = new String(produktList.get(i).getAuthor());
                for (int j = 0; j < us.size(); j++) {
                    if (us.get(j).getLogin().equals(user)) {
                        us.get(j).eigenT.add(produktList.get(i));
                        u.save();
                    }
                }

                if (produktList.get(i).getHighestb() != null) {
                    String user1 = new String(produktList.get(i).getHighestb());
                    for (int j = 0; j < us.size(); j++) {
                        if (us.get(j).getLogin().equals(user1)) {
                            us.get(j).bidsT.add(produktList.get(i));
                            u.save();
                        }
                    }
                }
            

            produkt.deleteProdukt(produktList.get(i));
            produkt.save();
            }
        
        }

        response.setContentType("text/html");
        response.sendRedirect("ListOfProducts.jsp?foo=" + name);
    }

}
