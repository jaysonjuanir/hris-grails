package com.system.hris

import java.nio.file.Path

class EmployeeController {
    def employeeService
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
    def viewProfile(){
        def emp = Employee.get(session['id'])
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
        
        render (view: "viewProfile", model:[emp:emp,pic:pic, pic1:pic1,pic2:pic2,pic3:pic3,pic4:pic4,pic5:pic5,pic6:pic6,pic7:pic7,pic8:pic8])
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
