package com.system.hris

class EmployeeController {

    def accountService
    def messagesService
	
    def index() {
        checkSession()
        def employeeLevel = session['level']
        if(employeeLevel == 1){
            def employeeId = session['id']
            def employee = Employee.get(employeeId.toInteger())
            println(employee)
            println(employeeId)
            def bulletin = Bulletin.list()
            //redirect action: "employee", bulletin:bulletin, employee:employee
            render (view: "employee", model:[bulletin:bulletin, employee:employee])
        }
        else if(employeeLevel == 2){
            redirect controller: 'manager', action:'index'
        }
        else{
            redirect controller: 'homePage', action:'index'
        }
    }
	
    def employee(){}
	
    def logout(){
        checkSession()
        session.invalidate()
        redirect controller: 'homePage', action:'index'
    }
	
    def sendMessage(){
        checkSession()
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
        redirect controller:"employee", action:"index"
    }
	
    def changePass(){
        checkSession()
        def oldPass = params.oldPass
        def newPass = params.newPass
        def newPass2 = params.newPass2
        def id = params.id
        def a = accountService.checkAccount(id.toInteger(), oldPass)
        def b = newPass.equals(newPass2)
        def acc = Account.get(id.toInteger())
        println("ACCOUNT: "+acc)
        println(id)
        println(a)
        println(b)
        def error = []
        def message = ""
        if(a && b){
            acc.password=newPass
            acc.save flush:true
            message = "Password Successfully Changed!"
            println("Password Successfully Changed!")
        }else{
            println("Error!")
            if(!a){
                error.add("Incorrect password!");
            }
            if(!b){
                error.add("Password does not match!");
            }
        }
        if(session['level']==1){
            redirect controller:"employee", action:"index"
            //render (view: "employee", model:[bulletin:bulletin, employee:employee, message:message])
        }
        else if(session['level']==2){
            redirect controller:"manager", action:"index"
            //render (view: "manager", model:[bulletin:bulletin, employee:employee, employees:employees, messages:messages, message:message])
        }
    }
    def checkSession(){
        def employeeLevel = session['level']
        if(employeeLevel == 2){
            redirect controller: 'manager', action:'index'
        }
        else if(employeeLevel == 1){
            return
        }
        else {
            redirect controller: 'homePage', action:'index'
        }
    }
}
