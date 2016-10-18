package com.system.hris

import grails.transaction.Transactional

@Transactional
class BulletinService {

    def saveBulletin(Bulletin bulletin) {
		bulletin.save flush:true
    }
	def getBulletin(){
		def bulletin = Bulletin.createCriteria().list{
			order("id", "desc")
		}
	}
	def deleteBulletin(Bulletin bulletin){
		bulletin.delete flush:true
	}
	def getBulletinById(int id){
		def bulletin = Bulletin.get(id)
		return bulletin
	}
}
