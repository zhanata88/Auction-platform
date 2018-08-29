package management;

import java.util.ArrayList;

import AuktionDAO.ProduktSerializierung;
import AuktionDAO.UserSerializierung;
import beans.*;
import beans.Person;
import beans.User;
public class UserManagement {

	private UserSerializierung userY= new UserSerializierung();	
	
	
	public boolean checkLoginAdmin(String login, String password){
		 if(password.equals("111")&& login.equals("admin"))
			 return true;
		 else return false;	  
	}
	
	
	public boolean checkLoginForscher(String login, String password){
		 if(password.equals("111")&& login.equals("forscher"))
			 return true;
		 else return false;	  
	}
	
	public boolean checkLoginUser(String login, String password){
		 int esGibtUser=0;
		for(Person passUser:userY.getUserList()){
	        if(password.equals(passUser.getPassword()) && login.equals(passUser.getLogin())) 
	        esGibtUser=1;}
	        if(esGibtUser==1)
	        	return true;
	        else
	        	return false;	
}
	
	public boolean userRegistration(String name, String surname, String login, String pass, String gender,
			String telnum, String email){
		if(name!=null&&surname!=null&&login!=null&&pass!=null&&gender!=null&&email!=null&&telnum!=null){
			User newuser= new User(name, surname, login,  pass,  gender,telnum,  email);
			userY.saveUser(newuser);
		return true;}
		else 
			return false;	
	}
	
	
	//diese methoden braucht man fuer forscher statistik//
	public int femaleAnzahl(){
		int femaleZahl =0;
		for(User user:userY.getUserList()){
			if((user.getGeschlecht()).equalsIgnoreCase("female"))
				femaleZahl++;}
			
			return femaleZahl;}
	
	public int maleAnzahl(){
		int maleZahl =0;
		
		for(User user:userY.getUserList()){
			if((user.getGeschlecht()).equalsIgnoreCase("male"))
			maleZahl++;}
			
			return maleZahl;}
             

		
	}

