
package AuktionDAO;
	
	import java.io.*;
	import java.util.ArrayList;

	import beans.Produkt;



	public class ProduktSerializierung{

		
		   private ArrayList<Produkt> produktList=new ArrayList<Produkt>();
		   private ArrayList<Produkt> produktList1=new ArrayList<Produkt>();
		  
		
		public void save(){
                    try {
				ObjectOutputStream objoutst=new ObjectOutputStream(new FileOutputStream("DB.txt"));
				objoutst.writeObject(produktList);
				objoutst.close();
			} 
			catch (IOException e) {
				e.printStackTrace();}
                }
		
		public void safeReport(){
            try {
		ObjectOutputStream objoutst=new ObjectOutputStream(new FileOutputStream("DBreport.txt"));
		objoutst.writeObject(produktList1);
		objoutst.close();
	} 
	catch (IOException e) {
		e.printStackTrace();}
        }
		
		public void saveReport(Produkt object2){
			 
			produktList1=getReportProduktList();
			
			produktList1.add(object2);
            try {
		ObjectOutputStream objoutst=new ObjectOutputStream(new FileOutputStream("DBreport.txt"));
		objoutst.writeObject(produktList1);
		objoutst.close();
	} 
	catch (IOException e) {
		e.printStackTrace();}


        }
		
		public void deleteReport(Produkt produkt) {
			produktList1=getReportProduktList();	  
	    for(int i=0; i<produktList1.size(); i++)
	    {
			if((produkt.getName()).equals(((produktList1.get(i)).getName())))
	        produktList1.remove(produktList1.get(i));		
	                try {
	ObjectOutputStream objoutst=new ObjectOutputStream(new FileOutputStream("C:\\Users\\user\\Desktop\\UNI\\DBreport.txt"));
   objoutst.writeObject(produktList1);
	    objoutst.close();}	
	catch (IOException e) {
			e.printStackTrace();}
	    }}
		
		

		@SuppressWarnings("unchecked")
		public ArrayList<Produkt> getReportProduktList() {
			
			try {
				ObjectInputStream objinpst=new ObjectInputStream (new FileInputStream("DBreport.txt"));
				produktList1=((ArrayList<Produkt>)objinpst.readObject());
				objinpst.close();	
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();}
			return produktList1;
		}

		@SuppressWarnings("unchecked")
		public ArrayList<Produkt> getProduktList() {
			try {
				ObjectInputStream objinpst=new ObjectInputStream (new FileInputStream("DB.txt"));
				produktList=((ArrayList<Produkt>)objinpst.readObject());
				objinpst.close();	
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();}
			return produktList;
		}

		
		public void saveProdukt(Produkt produkt) throws IllegalArgumentException{
			
		
			  
			produktList=getProduktList();
			produktList.add(produkt);
				try {
				ObjectOutputStream objoutst=new ObjectOutputStream(new FileOutputStream("DB.txt"));
				objoutst.writeObject(produktList);
				objoutst.close();
			} 
			catch (IOException e) {
				e.printStackTrace();}
		}

		public void deleteProdukt(Produkt produkt) {
			produktList=getProduktList();	
                for(int i=0; i<produktList.size(); i++){
		if((produkt.getName()).equals(((produktList.get(i)).getName())))
                produktList.remove(produktList.get(i));			
                try {
				ObjectOutputStream objoutst=new ObjectOutputStream(new FileOutputStream("DB.txt"));
			    objoutst.writeObject(produktList);
			    objoutst.close();}
		catch (IOException e) {
			e.printStackTrace();}	
			
		}}

		@SuppressWarnings("unchecked")
		public ArrayList<Produkt> groupByCategory(String category) {
			  ArrayList<Produkt> groupByCategory=new ArrayList<Produkt>();
			try {
				
				ObjectInputStream objinpst=new ObjectInputStream (new FileInputStream("DB.txt"));
				produktList=((ArrayList<Produkt>)objinpst.readObject());
				for(int i = 0; i<produktList.size(); i++)
					if(((produktList.get(i)).getCategory().equalsIgnoreCase(category)))
						groupByCategory.add(produktList.get(i));
								objinpst.close();	
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();}
			return groupByCategory;
		}
	
	}

