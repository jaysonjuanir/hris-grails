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
		contact nullable:true
		birthday nullable:true
		sss nullable:true
		bir nullable:true
		tin nullable:true
		philHealth nullable:true
		pagibig nullable:true
		avatar nullable:true
		tor nullable:true
		performanceAssessment nullable:true
		clearance nullable:true
		correctiveActions nullable:true
		workHistory nullable:true
		postEmployment nullable:true
		hiringRequirements nullable:true
		jobDescription nullable:true
	}
	/*static mapping = {
		birthday defaultValue: "'1/1/2000'"
		sss defaultValue: "a"
		bir defaultValue: "a"
		tin defaultValue: "a"
		philHealth defaultValue: "a"
		pagibig defaultValue: "a"
		avatar defaultValue: "a"
		tor defaultValue: "a"
		performanceAssessment defaultValue: "a"
		clearance defaultValue: "a"
		correctiveActions defaultValue: "a"
		workHistory defaultValue: "a"
		postEmployment defaultValue: "a"
		hiringRequirements defaultValue: "a"
		jobDescription defaultValue: "a"
	}*/
	def beforeInsert() {
		birthday = birthday?birthday:new Date(2000,1,1)
		sss = sss?sss:""
		bir = bir?bir:""
		tin = tin?tin:""
		philHealth = philHealth?philHealth:""
		pagibig = pagibig?pagibig:""
		avatar = avatar?avatar:""
		tor = tor?tor:""
		performanceAssessment = performanceAssessment?performanceAssessment:""
		clearance = clearance?clearance:""
		correctiveActions = correctiveActions?correctiveActions:""
		workHistory = workHistory?workHistory:""
		postEmployment = postEmployment?postEmployment:""
		hiringRequirements = hiringRequirements?hiringRequirements:""
		jobDescription = jobDescription?jobDescription:""
		contact = contact?contact:""
	}

	def beforeUpdate() {
		//his.updater = 'bar'
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
	String toString() {
		firstName + " " + middleName + " " + lastName
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
	String toString() {
		streetName+" " + barangay +" "+ city
	}
}
