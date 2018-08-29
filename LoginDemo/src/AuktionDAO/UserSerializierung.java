package AuktionDAO;

import java.io.*;
import java.util.ArrayList;

import beans.*;

public class UserSerializierung {

    private ArrayList<User> userList = new ArrayList<User>();

    public void save() {
        try {
            ObjectOutputStream objoutst = new ObjectOutputStream(new FileOutputStream("DBuser.ser"));
            objoutst.writeObject(userList);
            objoutst.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @SuppressWarnings("unchecked")
    public ArrayList<User> getUserList() {
        try {
            ObjectInputStream objinpst = new ObjectInputStream(new FileInputStream("DBuser.ser"));
            userList = ((ArrayList<User>) objinpst.readObject());
            objinpst.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public void saveUser(User user) throws IllegalArgumentException {

        userList = getUserList();
        userList.add(user);
        try {
            ObjectOutputStream objoutst = new ObjectOutputStream(new FileOutputStream("DBuser.ser"));
            objoutst.writeObject(userList);
            objoutst.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(User user) {
        userList = getUserList();
        for (int i = 0; i < userList.size(); i++) {
            if ((user.getLogin()).equals(((userList.get(i)).getLogin()))) {
                userList.remove(userList.get(i));
            }
        }
        try {
            ObjectOutputStream objoutst = new ObjectOutputStream(new FileOutputStream("DBuser.ser"));
            objoutst.writeObject(userList);
            objoutst.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void addRating(User u, Rating r) {
        userList = getUserList();
        for (int i = 0; i < userList.size(); i++) {
            if ((userList.get(i).getLogin()).equalsIgnoreCase(u.getLogin())) {

                userList.get(i).ratings = userList.get(i).ratings + 1;
                userList.get(i).sumrating = userList.get(i).sumrating + r.getA();
                userList.get(i).avrgrating = userList.get(i).sumrating / userList.get(i).ratings;
                userList.get(i).rating.add(r);
            }

        }
try {
            ObjectOutputStream objoutst = new ObjectOutputStream(new FileOutputStream("DBuser.ser"));
            objoutst.writeObject(userList);
            objoutst.close();
        } catch (IOException e) {
            System.out.println("Exception passiert");
            e.printStackTrace();
        }
    }
}
