package management;

import java.util.ArrayList;

import AuktionDAO.ProduktSerializierung;
import beans.Produkt;

public class ProduktManagement {
	
	 private ArrayList<Produkt> produktList=new ArrayList<Produkt>();
	 private ProduktSerializierung produktY=new ProduktSerializierung();
	  
	 public String getProduktList() {
			produktList=produktY.getProduktList();
			if(produktList!=null){
				
			String daten = "\n";
			for(Produkt cat: produktList)
				daten = daten + cat.toString() + "\n";
			return daten;}
			else return null;
			
		}
		
		public void saveProdukt(Produkt produkt){
			produktY.saveProdukt(produkt);
		}
		
		public void deleteProdukt(Produkt produkt) {
			produktY.deleteProdukt(produkt);
		}
		
		public ArrayList<Produkt> groupByCategory(String category) {
			produktList=produktY.groupByCategory(category);
			return produktList;
		}
		

		public  ArrayList<Produkt> getProduktbyName(String name)
		{
			ArrayList<Produkt> searchName = new ArrayList<Produkt>();
			produktList=produktY.getProduktList();
			String storig="/0";
			String lower=name.toLowerCase();
			for(Produkt nameSuchen: produktList){
				storig = nameSuchen.getName().toLowerCase();
		      int Index = storig.indexOf(lower);
		      if(Index != - 1)
					searchName.add(nameSuchen);}
			return searchName;
		}

}
