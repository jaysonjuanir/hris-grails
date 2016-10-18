package com.system.hris
class ManagerController {
    def messagesService
    def employeeService
    def accountService
    def allowedMethods = []
    def index() {
        def employeeLevel = session['level']
        if(employeeLevel == 2){
            def employeeId = session['id']
            def employees = Employee.list()
            def bulletin = Bulletin.list()
            def messages = messagesService.getMessagesById(employeeId)
            def employee = Employee.get(employeeId)
            def model=[:]
            render (view: "manager", model:[bulletin:bulletin, employee:employee, employees:employees, messages:messages])
        }
        else if(employeeLevel == 1){
            redirect controller: 'employee', action:'index'
        }
        else {
            redirect controller: 'homePage', action:'index'
        }
    }
	
    def logout(){
        session.invalidate()
        redirect controller: 'homePage', action:'index'
    }
    def editEmployee(){
        checkSession()
        def employees = Employee.list()
        def employeeId = session['id']
        def employee = Employee.get(employeeId)
		
        //redirect action: "managerEditEmployee", bulletin:bulletin, employee:employee, employees:employees, errors:params.errors
        render view: "managerEditEmployee", model:[employee:employee, employees:employees]
    }
    def editBulletin(){
        checkSession()
        def message = params.message
        def errors = params.errors
        println(message)
        println(errors)
        def bulletin = Bulletin.list()
        def employeeId = session["id"]
        def employee = Employee.get(employeeId)
        render view: "managerEditBulletin", model:[bulletin:bulletin, emp:employee, message:message, errors:errors]
    }
	
    def update={
        //def bulletinType = params.bulletinType
        //def bulletinSubject = params.bulletinSubject
        //def bulletinMessage = params.bulletinMessage
        //def employeeName = params.employeeName
        println( request.getInputStream())
        println(request.getFile("avatar").inputStream.text)
        //	def f = params.avatar
        //        println("AVATAR PICTURE"+params.avatar);
        //        println(request.getAttribute("avatar"));
        //        def e = request.getFile("avatar");

        //        CommonsMultipartFile f = request.getFile("avatar")
        //        println("THIS IMAGE?" + f);
        //        if(f){
        //            println("image uploaded?");
        //        }
        //println request.getFile('avatar')
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
        employee.sss = params.sss
        employee.bir = params.bir
        employee.tin = params.tin
        employee.philHealth = params.philHealth
        employee.pagibig = params.pagibig
        
        employee.save flush:true
        
        def avatar = request.getFile('avatar');
        def performanceAssessment = request.getFile('performanceAssessment');
        def clearance = request.getFile('clearance');
        def correctiveActions = request.getFile('correctiveActions');
        def workHistory = request.getFile('workHistory');
        def postEmployment = request.getFile('postEmployment');
        def hiringRequirements = request.getFile('hiringRequirements');
        def jobDescription = request.getFile('jobDescription');
        if(!avatar.isEmpty()){
            employee.avatar = employeeService.uploadFile(avatar, "${employee.id}."+avatar.contentType, "uploads/avatar")
            println("uploaded!");
        }
        else{
            println("profile pic was empty")
        }
        
        if(!performanceAssessment.isEmpty()){
            employee.performanceAssessment = employeeService.uploadFile(performanceAssessment, "${employee.id}."+performanceAssessment.contentType, "uploads/performanceAssessment")
            println("uploaded!");
        }
        else{
            println("performanceAssessment was empty")
        }
        
        if(!clearance.isEmpty()){
            employee.clearance = employeeService.uploadFile(clearance, "${employee.id}."+clearance.contentType, "uploads/clearance")
            println("uploaded!");
        }
        else{
            println("clearance was empty")
        }
        
        if(!correctiveActions.isEmpty()){
            employee.correctiveActions = employeeService.uploadFile(correctiveActions, "${employee.id}."+correctiveActions.contentType, "uploads/correctiveActions")
            println("uploaded!");
        }
        else{
            println("correctiveActions was empty")
        }
        if(!workHistory.isEmpty()){
            employee.workHistory = employeeService.uploadFile(workHistory, "${employee.id}."+workHistory.contentType, "uploads/workHistory")
            println("uploaded!");
        }
        else{
            println("workHistory was empty")
        }
        
        if(!postEmployment.isEmpty()){
            employee.postEmployment = employeeService.uploadFile(postEmployment, "${employee.id}."+postEmployment.contentType, "uploads/postEmployment")
            println("uploaded!");
        }
        else{
            println("postEmployment was empty")
        }
        
        if(!hiringRequirements.isEmpty()){
            employee.hiringRequirements = employeeService.uploadFile(hiringRequirements, "${employee.id}."+hiringRequirements.contentType , "uploads/hiringRequirements")
            println("uploaded!");
        }
        else{
            println("hiringRequirements was empty")
        }
        
        if(!jobDescription.isEmpty()){
            employee.jobDescription = employeeService.uploadFile(jobDescription, "${employee.id}."+jobDescription.contentType, "uploads/jobDescription")
            println("uploaded!");
        }
        else{
            println("jobDescription was empty")
        }
        //employee.tor = params.tor
        //            employee.performanceAssessment = params.performanceAssessment
        //            employee.clearance = params.clearance
        //            employee.correctiveActions = params.correctiveActions
        //            employee.workHistory = params.workHistory
        //            employee.postEmployment = params.postEmployment
        //            employee.hiringRequirements = params.hiringRequirements
        //            employee.jobDescription = params.jobDescription
		
        employee.save flush:true
        def employees = Employee.list()
        redirect action:"editEmployee", employees:employees
    }
    def add(){
        checkSession()
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
            employee.sss = params.sss
            employee.bir = params.bir
            employee.tin = params.tin
            employee.philHealth = params.philHealth
            employee.pagibig = params.pagibig
        
            employee.save flush:true
        
            def avatar = request.getFile('avatar');
            def performanceAssessment = request.getFile('performanceAssessment');
            def clearance = request.getFile('clearance');
            def correctiveActions = request.getFile('correctiveActions');
            def workHistory = request.getFile('workHistory');
            def postEmployment = request.getFile('postEmployment');
            def hiringRequirements = request.getFile('hiringRequirements');
            def jobDescription = request.getFile('jobDescription');
            if(!avatar.isEmpty()){
                employee.avatar = employeeService.uploadFile(avatar, "${employee.id}."+avatar.contentType, "uploads/avatar")
                println("uploaded!");
            }
            else{
                println("profile pic was empty")
            }
        
            if(!performanceAssessment.isEmpty()){
                employee.performanceAssessment = employeeService.uploadFile(performanceAssessment, "${employee.id}."+performanceAssessment.contentType, "uploads/performanceAssessment")
                println("uploaded!");
            }
            else{
                println("performanceAssessment was empty")
            }
        
            if(!clearance.isEmpty()){
                employee.clearance = employeeService.uploadFile(clearance, "${employee.id}."+clearance.contentType, "uploads/clearance")
                println("uploaded!");
            }
            else{
                println("clearance was empty")
            }
        
            if(!correctiveActions.isEmpty()){
                employee.correctiveActions = employeeService.uploadFile(correctiveActions, "${employee.id}."+correctiveActions.contentType, "uploads/correctiveActions")
                println("uploaded!");
            }
            else{
                println("correctiveActions was empty")
            }
            if(!workHistory.isEmpty()){
                employee.workHistory = employeeService.uploadFile(workHistory, "${employee.id}."+workHistory.contentType, "uploads/workHistory")
                println("uploaded!");
            }
            else{
                println("workHistory was empty")
            }
        
            if(!postEmployment.isEmpty()){
                employee.postEmployment = employeeService.uploadFile(postEmployment, "${employee.id}."+postEmployment.contentType, "uploads/postEmployment")
                println("uploaded!");
            }
            else{
                println("postEmployment was empty")
            }
        
            if(!hiringRequirements.isEmpty()){
                employee.hiringRequirements = employeeService.uploadFile(hiringRequirements, "${employee.id}."+hiringRequirements.contentType , "uploads/hiringRequirements")
                println("uploaded!");
            }
            else{
                println("hiringRequirements was empty")
            }
        
            if(!jobDescription.isEmpty()){
                employee.jobDescription = employeeService.uploadFile(jobDescription, "${employee.id}."+jobDescription.contentType, "uploads/jobDescription")
                println("uploaded!");
            }
            else{
                println("jobDescription was empty")
            }
            
            //            employee.tor = params.tor
            //            employee.performanceAssessment = params.performanceAssessment
            //            employee.clearance = params.clearance
            //            employee.correctiveActions = params.correctiveActions
            //            employee.workHistory = params.workHistory
            //            employee.postEmployment = params.postEmployment
            //            employee.hiringRequirements = params.hiringRequirements
            //            employee.jobDescription = params.jobDescription
            employee.save(flush:true)
			
            //def empId = employeeService.addEmployeeWithAccount(employee)
            def empId = employee.id
			
            def account = new Account()
			
            account.username=params.username
            account.password=params.password
            account.level = 1
            account.employeeId = empId
			
            account.save flush:true
            employee.accountId = account.id
            println(employee.accountId)
            println(employee)
			
            employee.save flush:true, failOnError:true
            def employees = Employee.list()
            def message = "Successful in creating an Employee"
			
            redirect action:"editEmployee", employees:employees, message:message
        }else{
            def error= []
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
            
            //todo
            redirect action:"editEmployee", model:[employees:employees, errors:error]
        }
    }
    def delete(){
        checkSession()
        def id = params.id
        def employee = Employee.get(id.toInteger())
        println(employee.accountId)
        def account = Account.get(employee.accountId)
        println(employee)
        println(account)
        employee.delete flush:true
        account.delete flush:true
        //accountService.deleteAccountByEmployeeId(id.toInteger())
        def employees = Employee.list()
        def message = "Success in deleting an employee"
        redirect action:"editEmployee", employees:employees, message:message
    }
	
    def addBulletin(){
        checkSession()
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
            bulletin.message = params.bulletinMessage
            bulletin.bulletinSubject = params.bulletinSubject
            bulletin.bulletinType = params.bulletinType
            bulletin.employeeName = params.employeeName
				
            bulletin.save flush:true
			
            def bulletins = Bulletin.list()
            def message = "Bulletin Added Successfully"
            redirect action:"editBulletin", model:[message:message, bulletin:bulletins]
        }
        else{
            def error = [:]
            if(!indicator){
                error.add("Missing required fields");
            }
			
            redirect action:"editBulletin", model:[errors:error, bulletin:bulletins]
        }
    }
    def deleteBulletin(){
        checkSession()
        def id = params.id
        def bulletin = Bulletin.get(id)
        bulletin.delete flush:true
		
        def bulletins = Bulletin.list()
        def message = "Bulletin Added Successfully"
        redirect action:"editBulletin", model:[message:message, bulletin:bulletins]
    }
    def updateBulletin(){
        checkSession()
        def bulletinType = params.bulletinType
        def bulletinSubject = params.bulletinSubject
        def bulletinMessage = params.bulletinMessage
        def employeeName = params.employeeName
        def id = params.id.toInteger()
        def indicator = true
        if(bulletinMessage.isEmpty() || bulletinSubject.isEmpty() || bulletinType.isEmpty() || employeeName.isEmpty()){
            indicator = false;
        }
		
        if(indicator){
            def bulletin = Bulletin.get(id)
            println(bulletin)
            println(bulletinMessage)
            println(bulletinSubject)
            println(bulletinType)
            println(employeeName)
			
            bulletin.message = params.bulletinMessage
            bulletin.bulletinSubject = params.bulletinSubject
            bulletin.bulletinType = params.bulletinType
            bulletin.employeeName = params.employeeName
            bulletin.save flush:true, failOnError:true
			
            def bulletins = Bulletin.list()
            def message = "Bulletin Added Successfully"
            println("success");
            redirect action:"editBulletin", model:[message:message]
        }
        else{
            def error = []
            if(!indicator){
                println("error");
                error.add("Missing required fields");
            }
			
            redirect action:"editBulletin", model:[errors:error]
        }
    }
    def changePass(){
        checkSession()
        def oldPass = params.oldPass
        def newPass = params.newPass
        def newPass2 = params.newPass2
        def id = params.id
        def a = accountService.checkAccount(id.toInteger(), oldPass)
        def b = newPass.equals(newPass2)
        def acc = Account.get(id)
        def error = []
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
        def employees = Employee.list()
        def messages = Messages.list()
        if(session['level']==1){
            redirect controller:"employee", action:"index"
        }
        else if(session['level']==2){
            redirect controller:"manager", action:"index"
            //render (view: "manager", model:[bulletin:bulletin, employee:employee, employees:employees, messages:messages, message:message])
        }
    }
    def checkSession(){
        def employeeLevel = session['level']
        if(employeeLevel == 2){
            return
        }
        else if(employeeLevel == 1){
            redirect controller: 'employee', action:'index'
        }
        else {
            redirect controller: 'homePage', action:'index'
        }
    }
    
    def download = {
        def storagePath = servletContext.getRealPath(params.path)
        println(storagePath+params.title)
        def file = new File(storagePath+"/"+params.title)
        response.setHeader("Content-Type", "application/octet-stream;")
        response.setHeader("Content-Disposition", "attachment;filename=\""+params.title+"\"")
        response.setHeader("Content-Length", "${file.size()}")

        response.outputStream << file.text.bytes
    }
}
