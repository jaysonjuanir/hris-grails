package com.system.hris

import grails.transaction.Transactional

@Transactional
class MessagesService {

	def saveMessage(Messages message) {
		message.save flush:true
	}
	def deleteMessage(Messages message){
		message.delete flush:true
	}
	def getMessagesById(int id){
		def message = Message.createCriteria().list{
			eq("receiver", id)
			order("id", "asc")
		}
	}
	
}
