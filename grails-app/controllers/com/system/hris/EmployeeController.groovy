package com.system.hris

class EmployeeController {

	def index() {
		def employeeLevel = session['level']
		if(employeeLevel == 1){
			def employeeId = session['id']
			def employee = Employee.get(employeeId)
			def bulletin = Bulletin.list()
			redirect action: "employee", bulletin:bulletin, employee:employee
		}
		else{
			redirect controller: 'homepage', action:'index'
		}
	}
	
	def employee(){}
	
	def logout(){
		session.invalidate()
		redirect controller: 'homepage', action:'index'
	}
	
	def sendMessage(){
		def firstName=params.firstName
		def lastName=params.lastName
		def message=params.message
		
		def fullName = firstName + " " + lastName
		
		def account = accountService.getAccountManagers()
		
		for(a in account){
			def messages = new Messages()
			messages.sender=fullName
			messages.receiver=a.employeeId
			messages.message=message
			messagesService.saveMessage(messages)
		}
		redirect action: "employee", bulletin:bulletin, employee:employee
	}
	
	def changePass(){
		def oldPass = params.oldPass
		def newPass = params.newPass
		def newPass2 = params.newPass2
		def id = params.id
		
		def a = AccountService.checkUsername(id, oldPass)
		
		def b = newPass.equals(newPass2)
		
		if(a && b){
			def acc = Account.get(id)
			redirect action: "employee", bulletin:bulletin, employee:employee, message:"Password Successfully Changed!"
		}
		else{
			def error
			if(!a){
				error.add("Incorrect oassword!")
			}
			if(!b){
				error.add("Password does not match!")
			}
			def bulletin = Bulletin.list()
			def employee = Employee.get(id)
			redirect action: "employee", bulletin:bulletin, employee:employee, error:error
		}
	}
}
