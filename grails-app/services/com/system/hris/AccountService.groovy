package com.system.hris

import grails.transaction.Transactional

@Transactional
class AccountService {

	def verifyAccount = { user, pass ->
		def employeeId = Account.withCriteria(uniqueResult:true){
			eq("username", user)
			eq("password", pass)
			projections {
				property('employeeId')
			}
		}
		if(!employeeId){
			employeeId = 0;
		}
		return employeeId
	}
	def deleteAccountByEmployeeId = { id ->
		def account = Account.get(id)
		account.delete flush:true
	}
	def getAccount = {user, pass ->
		def account = Account.withCriteria(uniqueResult:true){
			eq("username", user)
			eq("password", pass)
		}
		return account;
	}
	def saveAccount = {account ->
		account.save flush:true 
	}
	def checkUsername = {username ->
		def a = Account.withCriteria(uniqueResult:true){
			projections {
				count()
			}
			eq("username", username)
		}
		return a
	}
	def getAccountManagers(){
		def account = Account.createCriteria().list{
			eq("level", 2)
		}
		return account
	}
	def checkAccount(int emp, String pass){
		def check = false;
		def account = Account.withCriteria(uniqueResult:true){
			eq("employeeId", emp)
			eq("password", pass)
		}
		if(account){
			check = true
		}
		return check
	}
	def getAccountByEmployeeId(emp){
		def account = Account.withCriteria(uniqueResult:true){
			eq("employeeId",emp)
		}
		return account
	}
}
