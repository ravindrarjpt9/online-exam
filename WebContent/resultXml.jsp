
<%@page import="co.edureka.quiz.ResultModel"%>
<%@page import="co.edureka.quiz.Helper"%>
<%@ page contentType="text/xml; charset=ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <%@ include file="/WEB-INF/templates/sessionValidation.jsp"%> --%>
<%!Helper helper = new Helper();%>
<rows>
<% 
  String sPageNo = request.getParameter("page");
	String sRowsPerPage = request.getParameter("rows");
	String id = request.getParameter("id");
		
	
	
	

		int nRowsPerPage = 0;
		int nPageNo = 0;
		
		int total_pages = 0;
		int count = 0;

		if (sPageNo != null) {
			nPageNo = Integer.parseInt(sPageNo);
		}
		if (sRowsPerPage != null) {
			nRowsPerPage = Integer.parseInt(sRowsPerPage);
		}
			
		count = helper.getCountOfResult(id);
		if (count > 0 && nRowsPerPage != 0) {
  			total_pages = (int) (Math.ceil((double) count
  					/ (double) nRowsPerPage));
  		} else {
  			total_pages = 0;
  		}

  		// if for some reasons the requested page is greater than the total
  		// set the requested page to total page
  		if (nPageNo > total_pages) {
  			nPageNo = total_pages;
  		}
  		// calculate the starting position of the rows
  		int start = (nPageNo - 1) * nRowsPerPage;

  		// if for some reasons start position is negative set it to 0
  		// typical case is that the user type 0 for the requested page
  		if (start < 0) {
  			start = 0;
  		}
  		
  		StringBuilder sql =new StringBuilder("SELECT ID ,uid ,exam_type,start_time,no_of_qos,studentName,corrent_ans,status "+
  				" FROM  result");
  		if (id !=null && id.trim().equals(""))
  			sql.append(" where ").append(" id ='").append(id.trim()).append("' ");
  			sql.append(" order by id desc");
  		if (nRowsPerPage != 0) {
  			sql.append(" limit ").append(start).append(" , ")
  					.append(nRowsPerPage);
  		}
  		List<ResultModel> list = helper.getListOfResult(sql.toString());
%> <page><%=nPageNo%></page> <total><%=total_pages%></total> <records><%=String.valueOf(count)%></records>
<%   for (ResultModel obj : list) {
	   %><row id="<%=obj.getId()%>">
	   <cell><%=obj.getId()%></cell>
	   <cell><%=obj.getUserId()%></cell>
	   <cell><%=obj.getUserName()%></cell>
	   <cell><%=obj.getExamType()%></cell>
	   <cell><![CDATA[<%=obj.getNoOfQos()%>]]></cell>
	      <cell><![CDATA[<%=obj.getCorAns()%>]]></cell>
	       <cell><![CDATA[<%=obj.getsTime()%>]]></cell>
	      
	   <cell><![CDATA[<%=obj.getStatus()%>]]></cell>
	   
	   
	   
</row>
    	   <%}
    	   %>
    	</rows>
