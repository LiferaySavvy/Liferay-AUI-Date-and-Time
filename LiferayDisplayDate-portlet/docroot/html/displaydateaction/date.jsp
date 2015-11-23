<%@ include file="init.jsp" %>
<%@ page import="javax.portlet.ActionRequest" %>
<portlet:actionURL var="dateURL" windowState="<%= WindowState.NORMAL.toString()%>">
	<portlet:param name="<%=ActionRequest.ACTION_NAME%>" value="dateDisplay" />
</portlet:actionURL>
<portlet:renderURL var="homeURL" windowState="<%= WindowState.NORMAL.toString()%>">
</portlet:renderURL>
<aui:form action="<%=dateURL%>"  method="post" name="date">
	<aui:layout>
		<aui:column>
			<label class="aui-field-label"
				for="_corporatenewsadmin_WAR_CorporateNewsportlet_smallFile">Start
				Date</label>
		</aui:column>
		<aui:input name="startDateHidden" id="startDateHidden" type="hidden"  value="" ></aui:input>
		<aui:input name="startDateTimeHidden" id="startDateTimeHidden" type="hidden" value="" ></aui:input>
	</aui:layout>
	<aui:layout>
		<aui:column>
			<div id="myDatePicker"
				class="aui-datepicker aui-datepicker-display aui-helper-clearfix">
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
			<label class="aui-field-label"
				for="_corporatenewsadmin_WAR_CorporateNewsportlet_smallFile">End
				Date</label>
		</aui:column>
	</aui:layout>
	<aui:layout>
		<aui:column>
			<div id="datePicker">
				<div id="srcNode">
					<select id="monthNode">
						<option></option>
					</select> <select id="dayNode">
						<option></option>
					</select> <select id="yearNode">
						<option></option>
					</select>
					<div class="aui-datepicker-button-wrapper">
						<button type="button" id="expirationDateTrigger"
							class="aui-buttonitem-content aui-widget aui-component aui-buttonitem aui-state-default aui-buttonitem-icon-only">
							<span class="aui-buttonitem-icon aui-icon aui-icon-calendar"></span>
						</button>
					</div>
				</div>
			</div>
		</aui:column>
		<aui:input name="endDateHidden" id="endDateHidden" type="hidden" value="" ></aui:input>
		<aui:input name="endDateTimeHidden" id="endDateTimeHidden" type="hidden" value="" ></aui:input>
	</aui:layout>
	<aui:layout>
		<aui:column>
			&nbsp;
		</aui:column>
	</aui:layout>
	<aui:layout>
		<aui:column>
			<div id="myOtherDatePicker"
				class="aui-datepicker-example aui-helper-clearfix">
				<input type="text" size="50" id="myInput" name="myInput" />
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
var A = AUI();
//==========================
 var startDatePicker;
 var endDatePicker;
 var myOtherDatePicker;
 
AUI().use(
  'aui-datepicker',
  function(A) {
    startDatePicker=new A.DatePickerSelect(
      {
        appendOrder: ['m', 'd', 'y'],   //dateFormat: '%m/%d/%Y', dateFormat: '%m-%d-%Y', dateFormat: '%Y:%m:%d',dateFormat: '%Y:%d:%m'
        calendar: {
        dateFormat: '%m/%d/%Y',
          
        }
      }
    ).render('#myDatePicker');
    
    
    
    //===========
    
    endDatePicker=new A.DatePickerSelect(
      {
        boundingBox: '#datePicker',
        dayNode: '#dayNode',
        dayNodeName: 'daySelect',
        monthNode: '#monthNode',
        monthNodeName: 'monthSelect',
        appendOrder: ['m', 'd', 'y'],   //dateFormat: '%m/%d/%Y', dateFormat: '%m-%d-%Y', dateFormat: '%Y:%m:%d',dateFormat: '%Y:%d:%m'
        calendar: {
         dateFormat: '%m/%d/%Y',
        },
        render: true,
        srcNode: '#srcNode',
        trigger: '#expirationDateTrigger',
        yearNode: '#yearNode',
        yearNodeName: 'yearSelect',
        yearRange: [1980, 2013]
      }
    );
    
    //=====================
    
     myOtherDatePicker=new A.DatePicker(
      {
        calendar: {
          dateFormat: '%Y-%m-%d',   //dateFormat: '%m/%d/%Y', dateFormat: '%m-%d-%Y', dateFormat: '%Y:%m:%d',dateFormat: '%Y:%d:%m'
        },
        trigger: '#myInput'
      }
    ).render('#myOtherDatePicker');
    

  });
  
  // you see this more details  http://alloyui.com/versions/1.5.x/api/classes/Calendar.html#attr_date

 function submitForm(){
	var startDate;
	var endDate;    
    A.one("#<portlet:namespace/>startDateHidden").set('value',startDatePicker.calendar.getFormattedSelectedDates ()[0]);
    A.one("#<portlet:namespace/>endDateHidden").set('value',endDatePicker.calendar.getFormattedSelectedDates ()[0]);
    
    var startDate;
startDatePicker.calendar.eachSelectedDate(function(date) {
   startDate= date.getTime();
    A.one("#<portlet:namespace/>startDateTimeHidden").set('value',startDate);
  });   
  
  endDatePicker.calendar.eachSelectedDate(function(date) {
   endDate= date.getTime();
    A.one("#<portlet:namespace/>endDateTimeHidden").set('value',endDate);
  });  
  
  //Date Comparison
  
  if(startDate>endDate){
  alert("Start Date is more than end date");
  }else{
  document.<portlet:namespace/>date.submit();
  }
  
   // alert("=============startDateHidden========"+A.one("#<portlet:namespace/>startDateHidden").get('value'));
  //  alert("=============endDateHidden========"+A.one("#<portlet:namespace/>endDateHidden").get('value'));
   // alert("=============startDateTimeHidden========"+A.one("#<portlet:namespace/>startDateTimeHidden").get('value'));
   // alert("=============endDateTimeHidden========"+A.one("#<portlet:namespace/>endDateTimeHidden").get('value'));
    

}

</aui:script>
</aui:form>