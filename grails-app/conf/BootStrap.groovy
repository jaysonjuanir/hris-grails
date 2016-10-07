import com.system.hris.*
class BootStrap {

    def init = { servletContext ->
		if (Employee.count() == 0 && Account.count() == 0 && Bulletin.count()==0) {
			def name = new Name(firstName: 'John', middleName:'Jun', lastName: 'Doe')
			def address = new Address(streetName:'',barangay:'', city:'')
            def employee = new Employee(name:name, address: address, accountId:1, position:'manager',contact:'1',sss:'2',bir:'3',tin:'4',philHealth:'5',pagibig:'6',avatar:'7',tor:'8',performanceAssessment:'9',clearance:'1',correctiveActions:'2',workHistory:'3',postEmployment:'4',hiringRequirements:'5',jobDescription:'6').save(flush:true)
            def account = new Account(username: 'manager', password: '123', level: 2, employeeId:1).save(flush:true)
            new Bulletin(message: 'test this bulletin message', bulletinSubject: 'this subject', bulletinType: 'announcement', employeeName:'Name here').save(flush:true)
            new Bulletin(message: 'test this bulletin message', bulletinSubject: 'this subject', bulletinType: 'update', employeeName:'Name here').save(flush:true)
            new Bulletin(message: 'test this bulletin message', bulletinSubject: 'this subject', bulletinType: 'news', employeeName:'Name here').save(flush:true)
        }
		
		println(Account.list())
		println(Bulletin.list())
		println(Employee.list())
    }
    def destroy = {
    }
}