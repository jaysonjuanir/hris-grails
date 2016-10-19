package com.system.hris

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile
import org.codehaus.groovy.grails.web.context.ServletContextHolder

@Transactional
class EmployeeService {

    def saveEmployee(Employee employee) {
        employee.save flush:true
    }
    def addEmployeeWithAccount = { employee ->
        employee.save flush:true
        def empId = employee.id
        println(employee)
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
    String uploadFile(MultipartFile file, String name, String destinationDirectory) {

        def servletContext = ServletContextHolder.servletContext
        def storagePath = servletContext.getRealPath(destinationDirectory)

        // Create storage path directory if it does not exist
        def storagePathDirectory = new File(storagePath)
        if (!storagePathDirectory.exists()) {
            print "CREATING DIRECTORY ${storagePath}: "
            if (storagePathDirectory.mkdirs()) {
                println "SUCCESS"
            } else {
                println "FAILED"
            }
        }

        // Store file
        if (!file.isEmpty()) {
            file.transferTo(new File("${storagePath}/${name}"))
            println "Saved file: ${storagePath}/${name}"
            return "${storagePath}/${name}"

        } else {
            println "File ${file.inspect()} was empty!"
            return null
        }
    }
    String getExtension(String filePath){
        println("FILENAME: "+filePath)
        def fileName = filePath
        def extension=[] 
        extension = fileName.split('/')
        if(extension.length >1){
            String p =  (String)extension[1]
            println("THIS FILEEEEEE"+p);
            if(p=='vnd.openxmlformats-officedocument.wordprocessingml.document'){
                return "docx"
            }
            else if(p=="msword"){
                return "doc"
            }
            else{
                return p
            }
        }
        else{
            return null
        }
    }
    String getExtensionEmployee(String filePath){
        println("FILENAME: "+filePath)
        def fileName = filePath
        def extension=[] 
        extension = fileName.split("\\.")
        println("FILE LIST: "+extension)
        if(extension.length >1)
            return extension[1]
        else
            return null
    }
}
