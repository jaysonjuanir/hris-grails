package com.system.hris

class Employee {
	Name name
	Address address
	Date birthday
	String position
	String contact
	String sss
	String bir
	String tin
	String philHealth
	String pagibig
	String avatar
	String tor
	String performanceAssessment
	String clearance
	String correctiveActions
	String workHistory
	String postEmployment
	String hiringRequirements
	String jobDescription
	int accountId
	
	static embedded = ['name', 'address']
	static constraints = {
		contact nullable:false
		sss nullable:false
		bir nullable:false
		tin nullable:false
		philHealth nullable:false
		pagibig nullable:false
	}
}

class Name { 
	String firstName
	String middleName
	String lastName
	static constraints = {
		firstName nullable:false
		middleName nullable:false
		lastName nullable:false
	}
}

class Address {
	String streetName
	String barangay
	String city
	static constraints = {
		streetName nullable: false
		barangay nullable: false
		city nullable:false
	}
}
