package com.system.hris

class ManagerController {

	def index() {
		employeeLevel = session['level']
		if(employeeLevel){
			def employeeId = session['id']
			def employees = Employees.list()
			def bulletin = Bulletin.list()
			def messages = messagesService.getMessagesById(employeeId)
			def employee = Employee.get(employeeId)
			redirect action: "manager", bulletin:bulletin, employee:employee, employees:employees, messages:messages
		}
		else {
			redirect controller: 'homepage', action:'index'
		}
	}
	
	def logout(){
		session.invalidate()
		redirect controller: 'homepage', action:'index'
	}
	def editEmployee(){
		def employees = Employee.list()
		def employeeId = session['id']
		def employee = Employee.get(employeeId)
		
		redirect action: "managerEditEmployee", bulletin:bulletin, employee:employee, employees:employees, errors:params.errors
	}
	def editBulletin(){
		def bulletin = Bulletin.list()
		def employeeId = session["id"]
		def employee = Employee.get(employeeId)
		redirect action: "managerEditBulletin", bulletin:bulletin, emp:employee
	}
	
	def update(){
		//def bulletinType = params.bulletinType
		//def bulletinSubject = params.bulletinSubject
		//def bulletinMessage = params.bulletinMessage
		//def employeeName = params.employeeName
		
		def id = params.id
		def employee = Employee.get(id)
		
		def name = new Name()
		def address = new Address()
		name.with{
			firstName = params.firstName
			middleName = params.middleName
			lastName = params.lastName
		}
		address.with{
			streetName = params.streetName
			barangay = params.barangay
			city = params.city
		}
		employee.name = name
		employee.address = address
		employee.contact = params.contact
		employee.position = params.position
		
		employee.save flush:true
		def employees = Employee.list()
		redirect action:"managerEditEmployee", employees:employees, message:message
	}
	def add(){
		def username = params.username
		def checkUsername = (accountService.checkUsername(username) == 0)
		def password = params.password
		def password2 = params.password2
		def checkPassword = password.equals(password2)
		
		def indicator = true;
		if( params.firstName.isEmpty() || params.middleName.isEmpty() || params.lastName.isEmpty() || params.streetName.isEmpty() || params.barangay.isEmpty() || params.city.isEmpty() || params.contact.isEmpty() || params.position.isEmpty() ){
			indicator = false
		}
		
		if(checkUsername && checkPassword && indicator){
			def name = new Name()
			def address = new Address()
			def employee = new Employee()
			name.with{
				firstName = params.firstName
				middleName = params.middleName
				lastName = params.lastName
			}
			address.with{
				streetName = params.streetName
				barangay = params.barangay
				city = params.city
			}
			employee.name = name
			employee.address = address
			employee.contact = params.contact
			employee.position = params.position
			
			def empId = employeeService.addEmployeeWithAccount(employee)
			
			def account = new Account()
			account.with{
				username=params.username
				password=params.password
				level = 1
				employeeId = empId
			}
			account.save flush:true
			
			def employees = Employee.list()
			def message = "Successful in creating an Employee"
			
			redirect action:"managerEditEmployee", employees:employees, message:message
		}else{
			def error= [:]
			if(!checkUsername){
				error.add("Username already taken");
			}
			if(!checkPassword){
				error.add("Password dont match");
			}
			if(!indicator){
				error.add("Missing required fields");
			}
			def employees = Employee.list()
			redirect action:"managerEditEmployee", employees:employees, errors:error
		}
	}
	def delete(){
		def id = params.id
		def employee = Employee.get(id)
		employee.delete flush:true
		accountService.deleteAccountByEmployeeId(id)
		def employees = Employee.list()
		def message = "Success in deleting an employee"
		redirect action:"managerEditEmployee", employees:employees, message:message
	}
	
	def addBulletin(){
		def bulletinType = params.bulletinType
		def bulletinSubject = params.bulletinSubject
		def bulletinMessage = params.bulletinMessage
		def employeeName = params.employeeName
		
		def indicator = true
		if(bulletinMessage.isEmpty() || bulletinSubject.isEmpty() || bulletinType.isEmpty() || employeeName.isEmpty()){
			indicator = false;
		}
		
		if(indicator){
			def bulletin = new Bulletin()
			bulletin.with{
				message = params.bulletinMessage
				bulletinSubject = params.bulletinSubject
				bulletinType = params.bulletinType
				employeeName = params.employeeName
			}
			bulletin.save flush:true
			
			def bulletins = Bulletin.list()
			def message = "Bulletin Added Successfully"
			redirect action:"managerEditBulletin", message:message, bulletin:bulletins
		}
		else{
			def error = [:]
			if(!indicator){
				error.add("Missing required fields");
			}
			
			redirect action:"managerEditBulletin", errors:error, bulletin:bulletins
		}
	}
	def deleteBulletin(){
		def id = params.id
		def bulletin = Bulletin.get(id)
		bulletin.delete flush:true
		
		def bulletins = Bulletin.list()
		def message = "Bulletin Added Successfully"
		redirect action:"managerEditBulletin", message:message, bulletin:bulletins
	}
	def updateBulletin(){
		def bulletinType = params.bulletinType
		def bulletinSubject = params.bulletinSubject
		def bulletinMessage = params.bulletinMessage
		def employeeName = params.employeeName
		
		def indicator = true
		if(bulletinMessage.isEmpty() || bulletinSubject.isEmpty() || bulletinType.isEmpty() || employeeName.isEmpty()){
			indicator = false;
		}
		
		if(indicator){
			def bulletin = Bulletin.get(id)
			bulletin.with{
				message = params.bulletinMessage
				bulletinSubject = params.bulletinSubject
				bulletinType = params.bulletinType
				employeeName = params.employeeName
			}
			bulletin.save flush:true
			
			def bulletins = Bulletin.list()
			def message = "Bulletin Added Successfully"
			redirect action:"managerEditBulletin", message:message, bulletin:bulletins
		}
		else{
			def error = [:]
			if(!indicator){
				error.add("Missing required fields");
			}
			
			redirect action:"managerEditBulletin", errors:error, bulletin:bulletins
		}
	}
	def changePass(){
		def oldPass = params.oldPass
		def newPass = params.newPass
		def newPass2 = params.newPass2
		def id = params.id
		def a = accountService.checkUsername(id, oldPass)
		def b = newPass.equals.newPass2
		def acc = Account.get(id)
		def error = [:]
		def message = ""
		if(a && b){
			acc.password=newPass
			acc.save flush:true
			message = "Password Successfully Changed!"
		}else{
			if(!a){
				error.add("Incorrect password!");
			}
			if(!b){
				error.add("Password does not match!");
			}
		}
		def bulletin = Bulletin.list()
		def employee = Employee.get(id)
		redirect controller:"employee", action:"index", errors:error, bulletin:bulletins
	}
}
