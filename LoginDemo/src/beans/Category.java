package beans;

import java.io.Serializable;

public class Category implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	public Category(String name){
            setName(name);
        }
        
	public String getName(){
		return name;
	}
	
	   public void setName(String name){
			 this.name=name;
		 }
	   
	   
	   public  String  toString(){     	
			 return      
		             "\n"+ "Name:                    "+getName()+"\n\n";
		 }


}
