
package beans;

import java.util.ArrayList;
import java.util.Calendar;

public class User extends Person   {

	private static final long serialVersionUID = 8223420110690782101L;

	private String geschleht;
	private String telNum;
	private String email;
        public double avrgrating;
        public int ratings;
        public double sumrating;
	
        public ArrayList<Produkt> eigen;
        public ArrayList<Produkt> bids;
        public ArrayList<Rating> rating;
        public ArrayList<Produkt> eigenT;
        public ArrayList<Produkt> bidsT;
	public User(String name, String surname, String login, String password, String geschlecht, String  telNum, String email) {
		super(name, surname, login, password);
		
		this.geschleht=geschlecht;
		this.telNum=telNum;
		this.email=email;
                this.avrgrating= 0;
                this.ratings=0;
                this.sumrating= 0;
                this.eigen = new ArrayList();
                this.bids = new ArrayList();
                this.eigenT = new ArrayList();
                this.bidsT = new ArrayList();
                this.rating = new ArrayList();

	}
	
	
	public void setGeschlecht(String geschlecht){
			this.geschleht=geschlecht;
	}
	
	public void setTelNum(String telNum){
		this.telNum=telNum;
	}
	
	public void setEmail(String email){
		this.email=email;
	}
	
	
	public String getGeschlecht(){
		return this.geschleht;
	}
	
	public String getTelNum(){
		return this.telNum;
	}
	
	public String getEmail(){
		return this.email;
	}

	public  String  toString(){
		 
	
		 return      
	             "\n"+ "Name:                    "+getName()+
		         "\n"+ "Surname:                 " + getSurname() +
				 "\n"+ "Login:                " + getLogin()+ 
				 "\n" +"Password:               "+ getPassword() + 
				 "\n"+"Geschlecht:           " + getGeschlecht() +
				 "\n" + "TelNumber:           " + getTelNum()+
				 "\n"+" Email:                  "+getEmail()+"\n\n";
	 }}
