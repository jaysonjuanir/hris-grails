package com.system.hris

import grails.transaction.Transactional

@Transactional
class EmployeeService {

	def saveEnployee(Employee employee) {
		employee.save flush:true
	}
	def addEmployeeWithAccount(Employee employee){
		employee.save flush:true
		def empId = employee.id
		return empId
	}
	def getEmployees(){
		def employees = Employee.createCriteria().list{
			order("id", "desc")
		}
		return employees
	}
	def deleteEmployee(Employee employee){
		employee.delete flush:true
	}
	def getEmployeeById(int id){
		def employee = Employee.get(id)
		return employee
	}
}
