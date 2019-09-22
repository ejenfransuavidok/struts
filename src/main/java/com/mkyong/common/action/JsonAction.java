package com.mkyong.common.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.*;
import org.apache.struts.validator.DynaValidatorForm;
import org.json.JSONObject;

import java.io.IOException;

public class JsonAction  extends Action
{
    public ActionForward execute (
            ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response ) throws IOException, ServletException
    {
        JSONObject returnObject = new JSONObject();
        DynaActionForm myForm = (DynaActionForm) form;
        String receivedMessage = (String) myForm.get( "receivedMessage" );
        String responseMessage = "Your Message has been received";
        int number = 100;
        returnObject.put("Sent Message", receivedMessage);
        returnObject.put("Response Message", responseMessage);
        returnObject.put("Number", number);
        returnObject.put("base64", new ExportReportAction().getPdfBase64());

        myForm.set("json", returnObject.toString());

        return mapping.findForward( "success");
    }
}