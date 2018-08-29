package AuktionDAO;
	
	import java.io.*;
	import java.util.ArrayList;

	import beans.Category;



	public class CategorySerializierung {
		
		
		  private ArrayList<Category> categoryList=new ArrayList<Category>();
		 

        
		@SuppressWarnings("unchecked")
		public ArrayList<Category> getCategoryList() {
			try {
				ObjectInputStream objinpst=new ObjectInputStream (new FileInputStream("DBCategory.txt"));
				categoryList=((ArrayList<Category>)objinpst.readObject());
				objinpst.close();	
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();}
			return categoryList;
		}

		
		
		public void saveCategory(Category category){
				categoryList=getCategoryList();
					
			categoryList.add(category);
				try {
				ObjectOutputStream objoutst=new ObjectOutputStream(new FileOutputStream("DBCategory.txt"));
				objoutst.writeObject(categoryList);
				objoutst.close();
			} 
			catch (IOException e) {
				e.printStackTrace();}
		}
		

		//"C:\\Users\\simon\\Desktop\\DB.txt"
		public void deleteCategory(Category category) {
			categoryList=getCategoryList();
			 for(int i=0; i<categoryList.size(); i++){
					if((category.getName()).equals(((categoryList.get(i)).getName())))
			                categoryList.remove(categoryList.get(i));		
			try {
				ObjectOutputStream objoutst=new ObjectOutputStream(new FileOutputStream("DBCategory.txt"));
			    objoutst.writeObject(categoryList);
			    objoutst.close();}
		catch (IOException e) {
			e.printStackTrace();}	
			}

}
		}



