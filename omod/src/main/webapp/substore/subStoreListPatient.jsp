 <%--
 *  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Inventory module.
 *
 *  Inventory module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Inventory module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Inventory module.  If not, see <http://www.gnu.org/licenses/>.
 *
--%> 
<%@ include file="/WEB-INF/template/include.jsp" %>
<openmrs:require privilege="Add/Edit substore" otherwise="/login.htm" redirect="/module/inventory/main.form" />


<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="nav.jsp" %>
<h2><spring:message code="inventory.issueDrug.manage"/></h2>	
<br />
<c:forEach items="${errors.allErrors}" var="error">
	<span class="error"><spring:message code="${error.defaultMessage}" text="${error.defaultMessage}"/></span><
</c:forEach>

<br /><br />


<style>
@media print {
	.donotprint {
		display: none;
	}
	.spacer {
		margin-top: 100px;
		font-family: "Dot Matrix Normal", Arial, Helvetica, sans-serif;
		font-style: normal;
		font-size: 14px;
	}
	.printfont {
		font-family: "Dot Matrix Normal", Arial, Helvetica, sans-serif;
		font-style: normal;
		font-size: 14px;
	}
}
</style>
<form method="get"  id="form">
<table >
	<tr>
		<td>Patient Name/ID</td>
		<td>
			<input type="text" name="issueName" id="issueName" value="${issueName }"/>
		</td><td>&nbsp;&nbsp;</td>
		<td><spring:message code="inventory.fromDate"/></td>
		<td><input type="text" id="fromDate" class="date-pick left" readonly="readonly" name="fromDate" value="${fromDate}" title="Double Click to Clear" ondblclick="this.value='';"/></td><td>&nbsp;&nbsp;</td>
		<td><spring:message code="inventory.toDate"/></td>
		<td><input type="text" id="toDate" class="date-pick left" readonly="readonly" name="toDate" value="${toDate}" title="Double Click to Clear" ondblclick="this.value='';"/></td><td>&nbsp;&nbsp;</td>
		<td>Receipt No.</td>
		<td><input type="text" name="receiptId" id="receiptId" value="${receiptId }"/>
		<td><input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all" value="Search"/></td>
	</tr>
</table>
<br />
<span class="boxHeader"><spring:message code="inventory.issueDrug.list"/></span>
<div class="box">
<table width="100%" cellpadding="5" cellspacing="0">
	<tr>
	<th>S.No </th>
	<th>Receipt No.</th>
	<th><spring:message code="inventory.issueDrug.identifier"/></th>
    <th>Drug Regimen</th>
	<th>Name</th>
	<th>Age</th>
	<th>Gender</th>
	<th><spring:message code="inventory.issueDrug.createdOn"/></th>
	</tr>
<c:choose>
	<c:when test="${(not empty listIssue)  }">
	<c:forEach items="${listIssue}" var="issue" varStatus="varStatus">
	<c:choose>
	<c:when test="${(issue.values==0)&&(issue.statuss==1)&&(fromDate==null)&&(toDate==null) }">
	
	<tr class='${varStatus.index % 2 == 0 ? "oddRow" : "evenRow" } '>
	     
		<td><c:out value="${(( pagingUtil.currentPage - 1  ) * pagingUtil.pageSize ) + varStatus.count }"/></td>
		<td> ${issue.id}</td>
		<td> ${issue.identifier}</td>
       	<td> <a href="#" title="Detail issue drug to this patient" onclick="ISSUE.detailIssueDrug('${issue.id}');">View/Print</a> </td>
		<td>${issue.patient.givenName}&nbsp;${issue.patient.familyName}&nbsp;${fn:replace(issue.patient.middleName,","," ")}</td>
		<td><center>
              	<c:choose>
              		<c:when test="${issue.patient.age == 0  }">&lt 1</c:when>
              		<c:otherwise >${issue.patient.age }</c:otherwise>
              	</c:choose>
              	</center>
        </td>	
        <td><center>${issue.patient.gender }</center></td>
		<td><openmrs:formatDate date="${issue.createdOn}" type="textbox"/></td>
		</tr>
		</c:when>
		<c:when test="${(issue.values==0)&&(issue.statuss==1)&&(not empty fromDate)&&(not empty toDate) }">
	
	<tr class='${varStatus.index % 2 == 0 ? "oddRow" : "evenRow" } '>
	     
		<td><c:out value="${(( pagingUtil.currentPage - 1  ) * pagingUtil.pageSize ) + varStatus.count }"/></td>
		<td> ${issue.id}</td>
		<td> ${issue.identifier}</td>
       	<td> <a href="#" title="Detail issue drug to this patient" onclick="ISSUE.detailIssueDrug('${issue.id}');">View/Print</a> </td>
		<td>${issue.patient.givenName}&nbsp;${issue.patient.familyName}&nbsp;${fn:replace(issue.patient.middleName,","," ")}</td>
		<td><center>
              	<c:choose>
              		<c:when test="${issue.patient.age == 0  }">&lt 1</c:when>
              		<c:otherwise >${issue.patient.age }</c:otherwise>
              	</c:choose>
              	</center>
        </td>	
        <td><center>${issue.patient.gender }</center></td>
		<td><openmrs:formatDate date="${issue.createdOn}" type="textbox"/></td>
		</tr>
		</c:when>
	<c:when test="${(issue.values!=0)&&(issue.statuss==1)&&(not empty fromDate)&&(not empty toDate) }">
	
	<tr class='${varStatus.index % 2 == 0 ? "oddRow" : "evenRow" } '>
	     
		<td><c:out value="${(( pagingUtil.currentPage - 1  ) * pagingUtil.pageSize ) + varStatus.count }"/></td>
		<td> ${issue.id}</td>
		<td> ${issue.identifier}</td>
       	<td> <a href="#" title="Detail issue drug to this patient" onclick="ISSUE.detailIssueDrug('${issue.id}');">View/Print</a> </td>
		<td>${issue.patient.givenName}&nbsp;${issue.patient.familyName}&nbsp;${fn:replace(issue.patient.middleName,","," ")}</td>
		<td><center>
              	<c:choose>
              		<c:when test="${issue.patient.age == 0  }">&lt 1</c:when>
              		<c:otherwise >${issue.patient.age }</c:otherwise>
              	</c:choose>
              	</center>
        </td>	
        <td><center>${issue.patient.gender }</center></td>
		<td><openmrs:formatDate date="${issue.createdOn}" type="textbox"/></td>
		</tr>
		</c:when>
		
		</c:choose>
		
		</c:forEach>
		</c:when>
		</c:choose>
		</table>
		</div>
		</form>