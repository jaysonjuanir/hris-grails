package com.system.hris

import java.security.MessageDigest
import java.security.NoSuchAlgorithmException
import java.io.ByteArrayOutputStream
import net.sf.jasperreports.engine.JRExporter
import net.sf.jasperreports.engine.JasperCompileManager
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.JasperFillManager
import net.sf.jasperreports.engine.base.JRBaseLineBox
import net.sf.jasperreports.engine.JRExporterParameter
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource
import net.sf.jasperreports.engine.JasperExportManager
import net.sf.jasperreports.engine.export.JRPdfExporter
import net.sf.jasperreports.engine.export.JRCsvExporter
import net.sf.jasperreports.engine.export.JRXlsExporter
import net.sf.jasperreports.engine.export.JRXlsExporterParameter
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter
import net.sf.jasperreports.engine.export.JRXlsAbstractExporterParameter

import net.sf.jasperreports.engine.JasperReport
import net.sf.jasperreports.engine.design.JasperDesign
import net.sf.jasperreports.engine.design.JRDesignQuery
import net.sf.jasperreports.engine.xml.JRXmlLoader
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef
import net.sf.jasperreports.engine.export.JRHtmlExporter


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH
 

class CustomJasperService {

    boolean transactional = true
    javax.sql.DataSource dataSource

    def generateReport = { jasperFile, from, parameters ->
        JRExporter exporter

        switch(parameters.format){
        case 'PDF': log.info 'generating pdf ...'
            exporter = new JRPdfExporter()
            break
        case 'XLS': log.info 'generating xls ...'
            exporter = new JRXlsExporter()
            break
        case 'CSV': log.info 'generating csv...'
            exporter = new JRCsvExporter()
            break
        case 'HTML': log.info 'generating html...'
            exporter = new JRHtmlExporter();
            Map imagesMap = new HashMap();
            exporter.setParameter(JRHtmlExporterParameter.IMAGES_MAP, imagesMap);
            exporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, false);
            exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, SCH.servletContext.getRealPath("/")+"/reports/");
            exporter.setParameter(JRHtmlExporterParameter.IMAGES_DIR_NAME, SCH.servletContext.getRealPath("/")+"/reports/");
            exporter.setParameter(JRHtmlExporterParameter.IS_OUTPUT_IMAGES_TO_DIR, Boolean.TRUE);
        }

        ByteArrayOutputStream byteArray = new ByteArrayOutputStream()
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, byteArray)

        JasperPrint jasperPrint


        def conn = ((from == null) ? dataSource.getConnection() : new JRBeanCollectionDataSource(from));
        if (from == null) {
            try {
                if (new File("${jasperFile}" + File.separator + "${parameters._file}.jasper").canRead()) {
                    jasperPrint = JasperFillManager.fillReport("${jasperFile}" + File.separator + "${parameters._file}.jasper", parameters, conn)
                }
                else if (new File("${jasperFile}" + File.separator + "${parameters._file}.jrxml").canRead()) {
                    jasperPrint = JasperFillManager.fillReport(JasperCompileManager.compileReport("${jasperFile}" + File.separator + "${parameters._file}.jrxml"), parameters, conn)
                }
                else {
                    throw new Exception("Unknown Report File: ${jasperFile}" + File.separator + "${parameters._file}.jasper or .jrxml")
                }
            }
            finally {
                conn.close()
            }
        } else {
            if (new File("${jasperFile}" + File.separator + "${parameters._file}.jasper").canRead()) {
                jasperPrint = JasperFillManager.fillReport("${jasperFile}" + File.separator + "${parameters._file}.jasper", parameters, conn)
            }
            else if (new File("${jasperFile}" + File.separator + "${parameters._file}.jrxml").canRead()) {
                jasperPrint = JasperFillManager.fillReport(JasperCompileManager.compileReport("${jasperFile}" + File.separator + "${parameters._file}.jrxml"), parameters, conn)
            }
            else {
                throw new Exception("Unknown Report File: ${jasperFile}" + File.separator + "${parameters._file}.jasper or .jrxml")
            }
        }
		
        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint)
        exporter.exportReport()
        return byteArray
    }
	
    def generateMassReport = { printList, parameters ->
        JRExporter exporter
        switch(parameters){
        case 'PDF':
            log.info "generating pdf ..."
            exporter = new JRPdfExporter()
            break
        case 'XLS':
            log.info "generating xls ..."
            exporter = new JRXlsExporter()
            break
        case 'CSV':
            log.info "generating csv ..."
            exporter = new JRCsvExporter()
            break					
        }
        ByteArrayOutputStream byteArray = new ByteArrayOutputStream()
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, byteArray)
        exporter.setParameter(JRExporterParameter.JASPER_PRINT_LIST, printList)
        exporter.exportReport()	
  
        return byteArray
    }
  
    def generateJasperPrint = { jasperFile, from, parameters ->
        JasperPrint jasperPrint = null
        def conn = ((from == null) ? dataSource.getConnection() : new JRBeanCollectionDataSource(from));
        if(from == null){
            try {
                /*if (new File("${jasperFile}" + File.separator + "${parameters._file}.jasper").canRead()) {
                jasperPrint = JasperFillManager.fillReport("${jasperFile}" + File.separator + "${parameters._file}.jasper", parameters, conn)
                }
                else */if (new File("${jasperFile}" + File.separator + "${parameters._file}.jrxml").canRead()) {
                    jasperPrint = JasperFillManager.fillReport(JasperCompileManager.compileReport("${jasperFile}" + File.separator + "${parameters._file}.jrxml"), parameters, conn)
                }
                else {
                    throw new Exception("Unknown Report File: ${jasperFile}" + File.separator + "${parameters._file}.jasper or .jrxml")
                }
            }
            finally {
                conn.close()
            }
        }else{
            /*if (new File("${jasperFile}" + File.separator + "${parameters._file}.jasper").canRead()) {
            jasperPrint = JasperFillManager.fillReport("${jasperFile}" + File.separator + "${parameters._file}.jasper", parameters, conn)
            }
            else */if (new File("${jasperFile}" + File.separator + "${parameters._file}.jrxml").canRead()) {
                jasperPrint = JasperFillManager.fillReport(JasperCompileManager.compileReport("${jasperFile}" + File.separator + "${parameters._file}.jrxml"), parameters, conn)
            }
            else {
                throw new Exception("Unknown Report File: ${jasperFile}" + File.separator + "${parameters._file}.jasper or .jrxml")
            }
        }
        return jasperPrint
    }
    
}

