<%@ include file="init.jsp" %>
<%@ page import="javax.portlet.ActionRequest" %>
<portlet:actionURL var="dateTimeURL" windowState="<%= WindowState.NORMAL.toString()%>">
	<portlet:param name="<%=ActionRequest.ACTION_NAME%>" value="dateTimeDisplay" />
</portlet:actionURL>
<portlet:renderURL var="homeURL" windowState="<%= WindowState.NORMAL.toString()%>">
</portlet:renderURL>
<aui:form action="<%=dateTimeURL%>"  method="post"
	name="dateTime">
<aui:layout>
		<aui:column>
			<label class="aui-field-label"
				for="_corporatenewsadmin_WAR_CorporateNewsportlet_smallFile">Start Date</label>
		</aui:column>
	</aui:layout>
	<aui:layout>
		<aui:column>
			<div
				class="aui-datepicker aui-datepicker-display aui-helper-clearfix"
				id="startDatePickerBB">
				<div class="aui-datepicker-content" id="startDateSrcNode">
					<div class="aui-datepicker-select-wrapper">
						<select id="startDateMonthNode" name="startDateMonth"
							class="custom-field aui-datepicker-month">
							<option></option>
						</select> 
						<select id="startDateDayNode" name="startDateDay"
							class="custom-field aui-datepicker-day">
							<option></option>
						</select> 
						<select id="startDateYearNode" name="startDateYear"
							class="custom-field aui-datepicker-year">
							<option></option>
						</select>
					</div>
					<div class="aui-datepicker-button-wrapper">
						<button type="button" id="startDateTrigger"
							class="aui-buttonitem-content aui-widget aui-component aui-buttonitem aui-state-default aui-buttonitem-icon-only">
							<span class="aui-buttonitem-icon aui-icon aui-icon-calendar"></span>
						</button>
					</div>
				</div>
			</div>
			<div style="display:inline-block;">
				<liferay-ui:input-time amPmParam="startDateampm" hourParam="startDateHour"
					minuteParam="startDateMin" minuteInterval="10"
					cssClass="aui-field-input aui-field-input-date" />
			</div>
		</aui:column>
	</aui:layout>
	<aui:layout>
		<aui:column>
			<label class="aui-field-label"
				for="_corporatenewsadmin_WAR_CorporateNewsportlet_smallFile">End Date</label>
		</aui:column>
	</aui:layout>
	<aui:layout>
		<aui:column>
			<div
				class="aui-datepicker aui-datepicker-display aui-helper-clearfix"
				id="endDatePickerBB">
				<div class="aui-datepicker-content" id="endDateSrcNode">
					<div class="aui-datepicker-select-wrapper">
						<select id="endDateMonth" name="endDateMonth"
							class="custom-field aui-datepicker-month">
							<option></option>
						</select>
						 <select id="endDateDay" name="endDateDay"
							class="custom-field aui-datepicker-day">
							<option></option>
						</select> 
						<select id="endDateYear" name="endDateYear"
							class="custom-field aui-datepicker-year">
							<option></option>
						</select>
					</div>
					<div class="aui-datepicker-button-wrapper">
						<button type="button" id="endDateTrigger"
							class="aui-buttonitem-content aui-widget aui-component aui-buttonitem aui-state-default aui-buttonitem-icon-only">
							<span class="aui-buttonitem-icon aui-icon aui-icon-calendar"></span>
						</button>
					</div>
				</div>
			</div>
			<div style="display:inline-block;">
				<liferay-ui:input-time amPmParam="endDateAmPm"
					hourParam="endDateHour" minuteParam="endDateMin"
					minuteInterval="1" cssClass="aui-field-input aui-field-input-date" />
			</div>
		</aui:column>
	</aui:layout>
	<aui:layout>
		<aui:column>
			&nbsp;
		</aui:column>
	</aui:layout>
	<aui:layout>
		<aui:column>
			<aui:button type="button" value="submit" name="submit"
				onClick="submitForm();"></aui:button>
		</aui:column>
	</aui:layout>
	<hr/>
	<aui:layout>
<aui:column>
<aui:a href="<%=homeURL%>" label="Home"></aui:a>
</aui:column>
</aui:layout>
<aui:script>

var startDatePicker;
 var endDatePicker;
 AUI().use('aui-datepicker', function(A) {

    startDatePicker = new A.DatePickerSelect({
         srcNode: '#startDateSrcNode',
         trigger: '#startDateTrigger',
         contentBox: '#startDateSrcNode',
         boundingBox: '#startDatePickerBB',
        appendOrder: [ 'm', 'd', 'y'],
        calendar: {
            dateFormat: '%m/,%d/,%y/'
        },

        dayNode: '#startDateDayNode',
        monthNode:'#startDateMonthNode',
        yearNode:'#startDateYearNode',

        // dayNodeName: 'dayNode',
        // monthNodeName: 'monthNode',
        // yearNodeName: 'startDateYear',

        nullableDay: true,
        nullableMonth: true,
        nullableYear: true,

        // populateMonth: false,
        // populateDay: false,
        // populateYear: false,
        yearRange: [ 1980, (new Date).getFullYear() ]
    }).render();

});

AUI().use('aui-datepicker', function(A) {

    endDatePicker = new A.DatePickerSelect({
        srcNode: '#endDateSrcNode',
         trigger: '#endDateTrigger',
        contentBox: '#endDateSrcNode',
        boundingBox: '#endDatePickerBB',
        appendOrder: [ 'm', 'd', 'y'],
        calendar: {
            dateFormat: '%m/,%d/,%y/'
        },

        dayNode: '#endDateDay',
        monthNode:'#endDateMonth',
        yearNode:'#endDateYear',

        // dayNodeName: 'dayNode',
        // monthNodeName: 'monthNode',
        // yearNodeName: 'startDateYear',

        nullableDay: true,
        nullableMonth: true,
        nullableYear: true,

        // populateMonth: false,
        // populateDay: false,
        // populateYear: false,
        yearRange: [ 1980, (new Date).getFullYear() ]
    }).render();

});
 function submitForm(){
	var startDate;
	var endDate;  
	
startDatePicker.calendar.eachSelectedDate(function(date) {
   startDate= date.getTime();
  });   
  
  endDatePicker.calendar.eachSelectedDate(function(date) {
   endDate= date.getTime();
  });  
  
  //Date Comparison
  
  if(startDate>endDate){
  alert("Start Date is more than end date");
  }else{
  document.<portlet:namespace/>dateTime.submit();
  }
  
   // alert("=============startDateHidden========"+A.one("#<portlet:namespace/>startDateHidden").get('value'));
  //  alert("=============endDateHidden========"+A.one("#<portlet:namespace/>endDateHidden").get('value'));
   // alert("=============startDateTimeHidden========"+A.one("#<portlet:namespace/>startDateTimeHidden").get('value'));
   // alert("=============endDateTimeHidden========"+A.one("#<portlet:namespace/>endDateTimeHidden").get('value'));
    

}
</aui:script>
</aui:form>