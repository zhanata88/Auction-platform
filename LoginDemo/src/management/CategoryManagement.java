package management;

import java.util.ArrayList;

import AuktionDAO.*;
import beans.*;


public class CategoryManagement {
	
	private CategorySerializierung categoryX= new CategorySerializierung();
	private ProduktSerializierung produktX=new ProduktSerializierung();
	  private ArrayList<Category> categoryList=new ArrayList<Category>();
	  private ArrayList<Produkt> produktList=new ArrayList<Produkt>();
	  private ArrayList<Produkt> produktList1=new ArrayList<Produkt>();
	
	public String getCategoryList() {
		categoryList=categoryX.getCategoryList();
		if(categoryList!=null){
			
		String daten = "\n";
		for(Category cat: categoryList)
			daten = daten + cat.toString() + "\n";
		return daten;}
		else return null;
		
	}
	
	public void saveCategory(Category category){
		categoryX.saveCategory(category);
	}
	
	public void deleteCategory(Category category) {
		categoryX.deleteCategory(category);
	}
	
	
	public void modifyCategory(String oldName, String newName){
		
		produktList=produktX.getProduktList();
		for(Produkt produkt: produktList)
			if(produkt.getCategory().equalsIgnoreCase(oldName))
				produkt.setCategory(newName);
		produktX.save();
		
		produktList1=produktX.getReportProduktList();
		for(Produkt produkt: produktList1)
			if(produkt.getCategory().equalsIgnoreCase(oldName))
				produkt.setCategory(newName);
		produktX.safeReport();
		
		
		categoryList=categoryX.getCategoryList();
		for(int i = 0; i<categoryList.size(); i++)
			if(((categoryList.get(i)).getName()).equalsIgnoreCase(oldName))
				categoryX.deleteCategory(categoryList.get(i));
		Category cat= new Category(newName);
	           saveCategory(cat);			
	}
	
	
}
