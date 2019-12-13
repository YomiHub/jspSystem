package mybean.data;

import java.util.LinkedList;

public class Login {
	String logname="",backnews="",changePassBacknews="",changeRegisterInfoBack="";

	public String getChangeRegisterInfoBack() {
		return changeRegisterInfoBack;
	}

	public void setChangeRegisterInfoBack(String changeRegisterInfoBack) {
		this.changeRegisterInfoBack = changeRegisterInfoBack;
	}
	LinkedList<String> car;   //链表，用户的购物车
	public String getChangePassBacknews() {
		return changePassBacknews;
	}

	public void setChangePassBacknews(String changePassBacknews) {
		this.changePassBacknews = changePassBacknews;
	}

	public Login() {
		car = new LinkedList<String>();
	}
	
	public LinkedList<String> getCar(){
		return car;
	}

	public String getLogname() {
		return logname;
	}

	public void setLogname(String logname) {
		this.logname = logname;
	}

	public String getBacknews() {
		return backnews;
	}

	public void setBacknews(String backnews) {
		this.backnews = backnews;
	}
}
