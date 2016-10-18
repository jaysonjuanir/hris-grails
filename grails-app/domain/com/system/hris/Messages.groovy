package com.system.hris

class Messages {
	String sender;
	int receiver;
	String message;
	
	static constraints = {
		message nullable:false
	}
}
