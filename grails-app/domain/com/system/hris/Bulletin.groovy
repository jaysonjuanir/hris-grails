package com.system.hris

class Bulletin {
	
	String message;
	String bulletinSubject;
	String bulletinType;
	String employeeName;
	static constraints = {
		message nullable:false
		bulletinSubject nullable:false
		bulletinType nullable:false
		employeeName nullable:false
	}
}
