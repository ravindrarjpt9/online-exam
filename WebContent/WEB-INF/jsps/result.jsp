<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
<!-- JQuery CSS -->
 <link rel="stylesheet" type="text/css" href="http://www.trirand.com/blog/jqgrid/themes/redmond/jquery-ui-1.8.1.custom.css"/>
    <link rel="stylesheet" type="text/css" href="http://www.trirand.com/blog/jqgrid/themes/ui.jqgrid.css"/>
    <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/jquery.js"></script>
        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/jquery-ui-1.8.1.custom.min.js"></script>

        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/jquery.layout.js"></script>
        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/i18n/grid.locale-en.js"></script>
        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/ui.multiselect.js"></script>
        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/jquery.jqGrid.min.js"></script>
        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/jquery.tablednd.js"></script>
        <script type="text/javascript" src="http://www.trirand.com/blog/jqgrid/js/jquery.contextmenu.js"></script>

    <style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
}
</style>
<title>Result</title>
</head>
<body>

    <script type="text/javascript"> 
        $(document).ready(function () {
            $("#jqGrid").jqGrid({
            	url : '/OnlineQuiz/resultXml.jsp',
				postData: {id : document.getElementById("hid").value},
				datatype : 'xml',
				mtype : 'POST',
				colNames : ['ID', 'UID', 'Name', 'Exam','No of Qos',
							 'Right Ans', 'Start Time', 'Status'],
					
	                colModel: [
                    { label: 'id', name: 'id', key: true, width: 40,hidden : false },
                    { label: 'uid', name: 'uid', width: 150,hidden : true },
                    { label: 'name', name: 'name', width: 220 },
                    { label: 'exam', name: 'exam', width: 150 },
                    { label: 'noofqos', name: 'noofqos', width: 150 },
                    { label:'rightans', name: 'rightans', width: 150 },
                    { label:'stime', name: 'stime', width: 250 },
                    { label:'status', name: 'status', width: 150 }
                ],
				viewrecords: true,
                width: 780,
                height: 250,
                rowNum: 10,
                caption : "your exam list",
                pager: "#jqGridPager",
                loadComplete : function() {
					var rowIDs = jQuery("#jqGrid").getDataIDs();
					for ( var i = 0; i < rowIDs.length; i = i + 1) {
						rowData = jQuery("#jqGrid").getRowData(
								rowIDs[i]);
						if (rowData.status == "fail") {
							jQuery('#jqGrid').setCell(rowIDs[i],
									'status', '', {
										'background-color' : '#E60000'
									}, '');
						}
						else
							{
							jQuery('#jqGrid').setCell(rowIDs[i],
									'status', '', {
										'background-color' : '#7CFC00'
									}, '');
							}
					}
				}
            });
        });
 
   </script>
<div style="position:absolute;left:500px;top:70px">
<h3 align="center">Quiz Result</h3>
<table border=1>
        <tr>
            <td class="head">
                Quiz :
            </td>
            <td>
                <span id="lblSubject">${sessionScope.exam}</span></td>
        </tr>
        <tr>
            <td class="head">
                Starting Time :
            </td>
            <td >
                <span id="lblStime">${sessionScope.started}</span></td>
        </tr>
        
              
                <tr>
            <td class="head">
               No. of Questions :
            </td>
            <td>
                <span id="lblNquestions">10</span></td>
        </tr>
        
                <tr>
            <td class="head">
                No. of correct answers :
            </td>
            <td>
                <span id="lblNcans">${requestScope.result}</span></td>
        </tr>
        
    </table>

<c:if test="${requestScope.result >= 5}">
   <h3 align="center">Passed</h3>
</c:if>
<c:if test="${requestScope.result < 5}">
   <h3 align="center">Failed</h3>
</c:if>

<h2 align="center"><a href='${pageContext.request.contextPath}'>Take Another Exam</a></h2>

</div>

<div style="position:absolute; left:20%;top:350px">

<table id="jqGrid"></table>
    <div id="jqGridPager"></div>
</div>
<input type="hidden" name = "hid" id = "hid" value="<%=session.getAttribute("id")%>">
</body>
</html>