package servlets;

import AuktionDAO.UserSerializierung;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import management.UserManagement;

@WebServlet(name = "RegistrationServlet", urlPatterns = {"/RegistrationServlet"})
public class RegistrationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserSerializierung u = new UserSerializierung();
        UserManagement user = new UserManagement();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("Name");
        String surname = request.getParameter("Surname");
        String login = request.getParameter("Username");
        String pass = request.getParameter("UserPassword");
        String gender = request.getParameter("gender");
        String telnum = request.getParameter("Telephon Number");
        String email = request.getParameter("Email");
        for (int i = 0; i < u.getUserList().size(); i++) {
            if (login.equals(u.getUserList().get(i).getLogin())) {
                out.print("Username already taken");
                request.getRequestDispatcher("Registration.jsp").include(request, response);
            }
            if (email.equals(u.getUserList().get(i).getEmail())) {
                out.print("Email already taken");
                request.getRequestDispatcher("Registration.jsp").include(request, response);
            }
        }
        if (user.userRegistration(name, surname, login, pass, gender, telnum, email)) {
            out.print("You are registered  " + name);
            request.getRequestDispatcher("Login.jsp").include(request, response);
        } else {
            out.print("Please, fill in all the fields");
            request.getRequestDispatcher("Registration.jsp").include(request, response);
        }

    }
}
