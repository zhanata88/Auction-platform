package beans;

import java.io.Serializable;


public class Person implements Serializable  {

	private static final long serialVersionUID = 4051245022804589495L;
private String name;
private String surname;
private String login;
private String password;

public Person (String name, String surname, String login, String password){
	this.name=name;
	this.surname=surname;
	this.login=login;
	this.password=password;
}

public void setName(String name){
	this.name=name;
}

public void setSurname(String surname){
	this.surname=surname;
}

public void setLogin (String login){
	this.login=login;
}

public void setPassword (String password){
	this.password=password;
}

public String getName(){
	return this.name;
}
public String getSurname(){
	return this.surname;
}
public String getLogin(){
	return this.login;
}
public String getPassword(){
	return this.password;
}

}