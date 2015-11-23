<%@ include file="init.jsp" %>
<portlet:renderURL var="dateTimeURL" windowState="<%= WindowState.NORMAL.toString()%>">
	<portlet:param name="mvcPath" value="/html/displaydateaction/date_time.jsp" />
</portlet:renderURL>
<portlet:renderURL var="dateURL" windowState="<%= WindowState.NORMAL.toString()%>">
	<portlet:param name="mvcPath" value="/html/displaydateaction/date.jsp" />
</portlet:renderURL>
<portlet:renderURL var="homeURL" windowState="<%= WindowState.NORMAL.toString()%>">
</portlet:renderURL>
<aui:layout>
<aui:column>
<aui:a href="<%=dateTimeURL%>" label="Date Time Display"></aui:a>
</aui:column>
</aui:layout>
<aui:layout>
<aui:column>
<aui:a href="<%=dateURL%>" label="Date"></aui:a>
</aui:column>
</aui:layout>