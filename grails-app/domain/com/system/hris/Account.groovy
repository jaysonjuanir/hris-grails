package com.system.hris

class Account {
	String username;
	String password;
	int level;
	int employeeId;
	static constraints = {
		username nullable:false
		password nullable:false
	}
}
