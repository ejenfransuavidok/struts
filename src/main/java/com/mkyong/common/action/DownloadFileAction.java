package com.mkyong.common.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class DownloadFileAction extends Action {

	private static ExportReportAction exportReportAction = new ExportReportAction();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		try
		{
			exportReportAction.exportToPdf(response);
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	
}