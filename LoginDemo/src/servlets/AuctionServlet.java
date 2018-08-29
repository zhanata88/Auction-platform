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

@WebServlet(name = "AuctionServlet", urlPatterns = {"/AuctionServlet"})
public class AuctionServlet extends HttpServlet {

    private static final long serialVersionUID = 102831973239L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String desc = request.getParameter("desc");
        String category = request.getParameter("category");
        String user = request.getParameter("user");
        String date = request.getParameter("datepicker");
        DateFormat format = new SimpleDateFormat("MM/dd/yyyy");

        try {
            Date abl = format.parse(date);

            user = user.trim();
            ProduktSerializierung p = new ProduktSerializierung();
            for (int i = 0; i < p.getProduktList().size(); i++) {
                if (name.equals(p.getProduktList().get(i).getName())) {
                    out.print("Name already taken");
                    request.getRequestDispatcher("addauction.jsp").include(request, response);
                }
            }
            Date now = new Date(System.currentTimeMillis());
            if (abl.before(now)) {
                throw new Exception();
            }
            Produkt k = new Produkt(name, Double.parseDouble(price), Double.parseDouble(price), desc, category, user, abl);
            p.saveProdukt(k);
            UserSerializierung u = new UserSerializierung();
            ArrayList<User> us = u.getUserList();
            for (int i = 0; i < us.size(); i++) {
                if (us.get(i).getLogin().equals(user)) {
                    us.get(i).eigen.add(k);
                    u.save();
                }
            }
        } catch (NumberFormatException e) {
            out.print("Price Error");
            request.getRequestDispatcher("addauction.jsp").include(request, response);

        } catch (Exception e) {
            out.print("Date Error");
            request.getRequestDispatcher("addauction.jsp").include(request, response);
        }

        //Prüfen ob Zeit abgelaufen ist
        UserSerializierung u = new UserSerializierung();
        ArrayList<User> us = u.getUserList();
        ProduktSerializierung produkt = new ProduktSerializierung();
        ArrayList<Produkt> produktList = new ArrayList<Produkt>();
        for (int i = 0; i < produktList.size(); i++) {

            Date now = new Date(System.currentTimeMillis());
            if (produktList.get(i).getAblauf().before(now)) {

                String user2 = new String(produktList.get(i).getAuthor());
                for (int j = 0; j < us.size(); j++) {
                    if (us.get(j).getLogin().equals(user2)) {
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
        out.print("your Item is successfully posted on auction ");
        request.getRequestDispatcher("userMenu.jsp").include(request, response);

    }
}
