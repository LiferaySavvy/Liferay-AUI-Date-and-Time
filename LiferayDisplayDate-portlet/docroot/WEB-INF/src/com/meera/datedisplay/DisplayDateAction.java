package com.meera.datedisplay;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.journal.ArticleDisplayDateException;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class DisplayDateAction
 */
public class DisplayDateAction extends MVCPortlet {
 
	public void dateDisplay(
			ActionRequest actionRequest, ActionResponse actionResponse)
		throws IOException, PortletException {
		System.out.println("============dateDisplay====");
		// get direct date objects
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		DateFormat anotherdateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate=ParamUtil.getDate(actionRequest,"startDateHidden", dateFormat);
		Date enDate=ParamUtil.getDate(actionRequest,"endDateHidden", dateFormat);
		Date anotherDateFormat=ParamUtil.getDate(actionRequest,"myInput", dateFormat);
		_log.info("Start date"+startDate.getDate());
		_log.info("End date"+enDate.getDate());
		_log.info("Other date"+anotherDateFormat.getDate());
		// get date as String
		String startDateString=ParamUtil.getString(actionRequest,"startDateHidden");
		String endDateString=ParamUtil.getString(actionRequest,"endDateHidden");
		String otherDateString=ParamUtil.getString(actionRequest,"myInput");
		
		_log.info("startDateString"+startDateString);
		_log.info("endDateString"+endDateString);
		_log.info("otherDateString"+otherDateString);
		
		//get date as Milli seconds
		long startDateMillisecond=ParamUtil.getLong(actionRequest,"startDateTimeHidden");
		long endDateMillisecond=ParamUtil.getLong(actionRequest,"endDateTimeHidden");
		_log.info("startDateMillisecond"+startDateMillisecond);
		_log.info("endDateMillisecond"+endDateMillisecond);
		
		//Date from Milli secodns
		
		Date startDateMillisecondsDate=new Date(startDateMillisecond);
		Date endDateMillisecondsDate=new Date(endDateMillisecond);
		_log.info("Start date Day from Milli secinds date"+startDateMillisecondsDate.getDate());
		_log.info("End date day from milli seconds Date"+endDateMillisecondsDate.getDate());
		
	}
	
	public void dateTimeDisplay(
			ActionRequest actionRequest, ActionResponse actionResponse)
		throws IOException, PortletException, PortalException {
		System.out.println("============dateTimeDisplay====");
		int startDateMonth = ParamUtil.getInteger(
				actionRequest, "startDateMonth");
			int startDateDay = ParamUtil.getInteger(
					actionRequest, "startDateDay");
			int startDateYear = ParamUtil.getInteger(
					actionRequest, "startDateYear");
			int startDateHour = ParamUtil.getInteger(
					actionRequest, "startDateHour");
			int startDateMinute = ParamUtil.getInteger(
					actionRequest, "startDateMin");
			int startDateAmPm = ParamUtil.getInteger(
					actionRequest, "startDateampm");

			if (startDateAmPm == Calendar.PM) {
				startDateHour += 12;
			}

			int endDateMonth = ParamUtil.getInteger(
					actionRequest, "endDateMonth");
			int endDateDay = ParamUtil.getInteger(
					actionRequest, "endDateDay");
			int endDateYear = ParamUtil.getInteger(
					actionRequest, "endDateYear");
			int endDateHour = ParamUtil.getInteger(
					actionRequest, "endDateHour");
			int endDateMinute = ParamUtil.getInteger(
					actionRequest, "endDateMin");
			int endDateAmPm = ParamUtil.getInteger(
					actionRequest, "endDateAmPm");

			if (endDateAmPm == Calendar.PM) {
				endDateHour += 12;
			}
			ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest.getAttribute(com.liferay.portal.kernel.util.WebKeys.THEME_DISPLAY);
			Date startDate = PortalUtil.getDate(
					startDateMonth, startDateDay, startDateYear, startDateHour,
					startDateMinute, themeDisplay.getUser().getTimeZone(),
					ArticleDisplayDateException.class);
			Date endDate = PortalUtil.getDate(
					endDateMonth, endDateDay, endDateYear, endDateHour,
					endDateMinute, themeDisplay.getUser().getTimeZone(),
					ArticleDisplayDateException.class);
			
			_log.info("Start date"+startDate.getDate());
			_log.info("End date"+endDate.getDate());
			
		
	}
	
	private static Log _log = LogFactoryUtil.getLog(DisplayDateAction.class);
}
