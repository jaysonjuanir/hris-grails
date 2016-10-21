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
    def employeeViews(){
        def emp = Employee.get(params.id)
        println("THIS EMPLOYEE!: "+emp);
        File file = new File(emp.avatar);
        File file1 = new File(emp.tor);
        File file2 = new File(emp.performanceAssessment);
        File file3 = new File(emp.clearance);
        File file4 = new File(emp.correctiveActions);
        File file5 = new File(emp.workHistory);
        File file6 = new File(emp.postEmployment);
        File file7 = new File(emp.hiringRequirements);
        File file8 = new File(emp.jobDescription);
        
        
        String p = file.getName();
        String pic
        String pic1
        String pic2
        String pic3
        String pic4
        String pic5
        String pic6
        String pic7
        String pic8
        String p1 = file1.getName();
        String p2 = file2.getName();
        String p3 = file3.getName();
        String p4 = file4.getName();
        String p5 = file5.getName();
        String p6 = file6.getName();
        String p7 = file7.getName();
        String p8 = file8.getName();
        if(p)
        pic = employeeService.getExtensionEmployee(p)
        
        if(p1)
        pic1 = employeeService.getExtensionEmployee(p1)
       
        if(p2)
        pic2 = employeeService.getExtensionEmployee(p2)
        
        if(p3)
        pic3 = employeeService.getExtensionEmployee(p3)
       
        if(p4)
        pic4 = employeeService.getExtensionEmployee(p4)
        
        if(p5)
        pic5 = employeeService.getExtensionEmployee(p5)
            
        if(p6)
        pic6 = employeeService.getExtensionEmployee(p6)
        
        if(p7)
        pic7 = employeeService.getExtensionEmployee(p7)
        
        if(p8)
        pic8 = employeeService.getExtensionEmployee(p8)
        
        render (view: "manager201Files", model:[emp:emp,pic:pic, pic1:pic1,pic2:pic2,pic3:pic3,pic4:pic4,pic5:pic5,pic6:pic6,pic7:pic7,pic8:pic8])
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
        def tor = request.getFile('tor');
        def performanceAssessment = request.getFile('performanceAssessment');
        def clearance = request.getFile('clearance');
        def correctiveActions = request.getFile('correctiveActions');
        def workHistory = request.getFile('workHistory');
        def postEmployment = request.getFile('postEmployment');
        def hiringRequirements = request.getFile('hiringRequirements');
        def jobDescription = request.getFile('jobDescription');
        if(!avatar.isEmpty()){
            employee.avatar = employeeService.uploadFile(avatar, "${employee.id}."+employeeService.getExtension(avatar.getContentType()), "uploads/avatar")
            println("uploaded!");
        }
        else{
            println("profile pic was empty")
        }
        
        if(!tor.isEmpty()){
            employee.tor = employeeService.uploadFile(tor, "${employee.id}."+employeeService.getExtension(tor.getContentType()), "uploads/tor")
            println("uploaded!");
        }
        else{
            println("tor was empty")
        }
            
        if(!performanceAssessment.isEmpty()){
            employee.performanceAssessment = employeeService.uploadFile(performanceAssessment, "${employee.id}."+employeeService.getExtension(performanceAssessment.getContentType()), "uploads/performanceAssessment")
            println("uploaded!");
        }
        else{
            println("performanceAssessment was empty")
        }
        
        if(!clearance.isEmpty()){
            employee.clearance = employeeService.uploadFile(clearance, "${employee.id}."+employeeService.getExtension(clearance.getContentType()), "uploads/clearance")
            println("uploaded!");
        }
        else{
            println("clearance was empty")
        }
        
        if(!correctiveActions.isEmpty()){
            employee.correctiveActions = employeeService.uploadFile(correctiveActions, "${employee.id}."+employeeService.getExtension(correctiveActions.getContentType()), "uploads/correctiveActions")
            println("uploaded!");
        }
        else{
            println("correctiveActions was empty")
        }
        if(!workHistory.isEmpty()){
            employee.workHistory = employeeService.uploadFile(workHistory, "${employee.id}."+employeeService.getExtension(workHistory.getContentType()), "uploads/workHistory")
            println("uploaded!");
        }
        else{
            println("workHistory was empty")
        }
        
        if(!postEmployment.isEmpty()){
            employee.postEmployment = employeeService.uploadFile(postEmployment, "${employee.id}."+employeeService.getExtension(postEmployment.getContentType()), "uploads/postEmployment")
            println("uploaded!");
        }
        else{
            println("postEmployment was empty")
        }
        
        if(!hiringRequirements.isEmpty()){
            employee.hiringRequirements = employeeService.uploadFile(hiringRequirements, "${employee.id}."+employeeService.getExtension(hiringRequirements.getContentType()) , "uploads/hiringRequirements")
            println("uploaded!");
        }
        else{
            println("hiringRequirements was empty")
        }
        
        if(!jobDescription.isEmpty()){
            employee.jobDescription = employeeService.uploadFile(jobDescription, "${employee.id}."+employeeService.getExtension(jobDescription.getContentType()), "uploads/jobDescription")
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
            def tor = request.getFile('tor');
            def performanceAssessment = request.getFile('performanceAssessment');
            def clearance = request.getFile('clearance');
            def correctiveActions = request.getFile('correctiveActions');
            def workHistory = request.getFile('workHistory');
            def postEmployment = request.getFile('postEmployment');
            def hiringRequirements = request.getFile('hiringRequirements');
            def jobDescription = request.getFile('jobDescription');
            if(!avatar.isEmpty()){
                employee.avatar = employeeService.uploadFile(avatar, "${employee.id}."+employeeService.getExtension(avatar.getContentType()), "uploads/avatar")
                println("uploaded!");
            }
            else{
                println("profile pic was empty")
            }
            
            if(!tor.isEmpty()){
                employee.tor = employeeService.uploadFile(tor, "${employee.id}."+employeeService.getExtension(tor.getContentType()), "uploads/tor")
                println("uploaded!");
            }
            else{
                println("tor was empty")
            }
        
            if(!performanceAssessment.isEmpty()){
                employee.performanceAssessment = employeeService.uploadFile(performanceAssessment, "${employee.id}."+employeeService.getExtension(performanceAssessment.getContentType()), "uploads/performanceAssessment")
                println("uploaded!");
            }
            else{
                println("performanceAssessment was empty")
            }
        
            if(!clearance.isEmpty()){
                employee.clearance = employeeService.uploadFile(clearance, "${employee.id}."+employeeService.getExtension(clearance.getContentType()), "uploads/clearance")
                println("uploaded!");
            }
            else{
                println("clearance was empty")
            }
        
            if(!correctiveActions.isEmpty()){
                employee.correctiveActions = employeeService.uploadFile(correctiveActions, "${employee.id}."+employeeService.getExtension(correctiveActions.getContentType()), "uploads/correctiveActions")
                println("uploaded!");
            }
            else{
                println("correctiveActions was empty")
            }
            if(!workHistory.isEmpty()){
                employee.workHistory = employeeService.uploadFile(workHistory, "${employee.id}."+employeeService.getExtension(workHistory.getContentType()), "uploads/workHistory")
                println("uploaded!");
            }
            else{
                println("workHistory was empty")
            }
        
            if(!postEmployment.isEmpty()){
                employee.postEmployment = employeeService.uploadFile(postEmployment, "${employee.id}."+employeeService.getExtension(postEmployment.getContentType()), "uploads/postEmployment")
                println("uploaded!");
            }
            else{
                println("postEmployment was empty")
            }
        
            if(!hiringRequirements.isEmpty()){
                employee.hiringRequirements = employeeService.uploadFile(hiringRequirements, "${employee.id}."+employeeService.getExtension(hiringRequirements.getContentType()) , "uploads/hiringRequirements")
                println("uploaded!");
            }
            else{
                println("hiringRequirements was empty")
            }
        
            if(!jobDescription.isEmpty()){
                employee.jobDescription = employeeService.uploadFile(jobDescription, "${employee.id}."+employeeService.getExtension(jobDescription.getContentType()), "uploads/jobDescription")
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

        //response.outputStream << file.text.bytes
        
        def fileInputStream = new FileInputStream(file)
        def outputStream = response.getOutputStream()

        byte[] buffer = new byte[4096];
        int len;
        while ((len = fileInputStream.read(buffer)) > 0) {
            outputStream.write(buffer, 0, len);
        }

        outputStream.flush()
        outputStream.close()
        fileInputStream.close()
    }
}
