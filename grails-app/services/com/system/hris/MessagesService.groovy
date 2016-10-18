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
	def getMessagesById(def id){
		def message = Messages.createCriteria().list{
			eq("receiver", id.toInteger())
			order("id", "asc")
		}
		return message
	}
	
}
