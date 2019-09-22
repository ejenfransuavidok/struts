package com.mkyong.common.action;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.xmp.impl.Base64;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;

class ExportReportAction {

    public void exportToPdf(HttpServletResponse response) { // no return type
        try {
            Document document = new Document();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter.getInstance(document, baos);
            document.open();
            document.add(new Paragraph("success PDF FROM STRUTS"));
            document.close();
            ServletOutputStream outputStream = response.getOutputStream();
            baos.writeTo(outputStream);
            response.setHeader("Content-Disposition", "attachment; filename=\"stuReport.pdf\"");
            response.setContentType("application/pdf");
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            //catch
        }
    }

    public String getPdfBase64() {
        try {
            Document document = new Document();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter.getInstance(document, baos);
            document.open();
            document.add(new Paragraph("success PDF FROM STRUTS"));
            document.close();
            return com.itextpdf.text.pdf.codec.Base64.encodeBytes(baos.toByteArray()).replace("\n", "");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
