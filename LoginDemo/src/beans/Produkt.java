package beans;

import java.io.Serializable;
import java.util.Date;

public class Produkt implements Serializable{

		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		private String name;
		private double startpreis;
		private double aktuelpreis;
		private String beschreibung;
		private String category;
		private String Author;
                private String highestb;
                private Date ablauf;
                private int payed;

 

		//private Calendar dateOfpostAuktion;
		public Produkt(String name, double startpreis, double aktuelpreis,
                String desc, String category, String Author, Date Ablauf){
                setName(name);
                setStartpreis(startpreis);
                setAktuelpreis(aktuelpreis);
                setBeschreibung(desc);
                setCategory(category);
                setAuthor(Author);
                setAblauf(Ablauf);
                setPayed(0);
                }
		public double getAktuelpreis(){
			return aktuelpreis;
		}
		
		public double getStartpreis(){
			return startpreis;
		}
		
		public String getName(){
			return name;
		}
		
		public String getBeschreibung(){
			return beschreibung;
		}
		
		public String getCategory(){
			return category;
		}
		
		/*public Calendar getDateOfpostAuktion(){
			return dateOfpostAuktion;
		}

		public void setDateOfpostAuktion (){
		       Calendar nowDate=Calendar.getInstance();
		    	   this.dateOfpostAuktion=nowDate; }*/
		
		
		
		       
		       public void setAktuelpreis (double preis){
		   			 aktuelpreis=preis;
		   	      }
		       
		       
		       
		       public void setName(String name){
					 this.name=name;
				 }
		       
		       public void setStartpreis(double startpreis){
		   			 this.startpreis=startpreis;
		   	      }
				 
		       
		       public void setBeschreibung(String beschreibung){
					 this.beschreibung=beschreibung;
				 }
		       
		       public void setCategory(String category){
					 this.category=category.toLowerCase();
				 }
		       public  String  toString(){
		  		 
		    		
		  		 return      
		  	             "\n"+ "Name:                    "+getName()+
		  		         "\n"+ "aktuelpreis:             " + getAktuelpreis() +
		  				 "\n"+ "startpreis:              " + getStartpreis()+ 
		  				 "\n" +"Beschreibung:            "+ getBeschreibung() + 
		  				 "\n" + "Category:               " + getCategory()+"\n\n";
		  	 }
			public String getAuthor() {
				return Author;
			}
			public void setAuthor(String author) {
				Author = author;
			}
                        public void setHighestb(String highestB){
                            highestb = highestB;
                        }
                        public String getHighestb(){
                            return highestb;
                        }
                            public Date getAblauf() {
                                return ablauf;
                                }

                        public void setAblauf(Date ablauf) {
                             this.ablauf = ablauf;
                            }
                           public int getPayed() {
        return payed;
    }

    public void setPayed(int payed) {
        this.payed = payed;
    }

                        
}
