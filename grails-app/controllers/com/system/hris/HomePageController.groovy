package com.system.hris

class HomePageController {
	def accountService
	def index() {
		println(session['id'])
		if(session['id']){
			def employeeLevel = session['level']
			if(employeeLevel){
				if(employeeLevel==1){
					redirect controller: 'employee', action:'index'
				}
				else if(employeeLevel==2){
					redirect controller: 'manager', action:'index'
					println('manager logged in')
				}
			}
			else{
				println('not logged in')
				respond message:'not logged in'
			}
			render '1st'
		}else{ //if null or logged out
			println('not logged in because there was no session')
			respond message:'not logged in'
		}
		
		println(Account.list())
		println(Bulletin.list())
		println(Employee.list())
	}
	def login(){
		def user = params.user
		def pass = params.pass
		def id = accountService.verifyAccount(user,pass)
		def ac = accountService.getAccount(user,pass)
		def bulletin = Bulletin.list()
		
		if(ac){
			session["id"]=ac.id
			session["level"]=ac.level
			if(ac.level==1){
				redirect controller: 'employee', action:'index'
			}
			else{
				redirect controller: 'manager', action:'index'
				println('logging in as manager')
			}
		}
		else{
			redirect action:"index"
		}
	}
	//insert into employee values(1,0,1,'Barangay', 'City', 'Street', 'avatar','bir', '7/7/2000', 'clearance', 'contact', 'corrective actions', 'hiring', 'job', 'first', 'last', 'middle', 'pagibig', 'perf', 'philhealth', 'Manager', 'post employment', 'sss', 'tin', 'tor', 'work')
}
