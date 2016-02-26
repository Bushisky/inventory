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
<%@ include file="../includes/js_css.jsp" %>
<br/>


<center><openmrs:hasPrivilege privilege="Drug order queue"><b><a href="#" onclick="ACT.go('patientQueueDrugOrder.form');">Drug</a>&nbsp;| Item </b></openmrs:hasPrivilege></center>
<center><openmrs:hasPrivilege privilege="Drug/Item Dispense"><b><a href="#" onclick="ACT.go('subStoreIssueDrugList.form');">Drug</a>&nbsp;| Item </b></openmrs:hasPrivilege></center>
<br/><br/>
<openmrs:hasPrivilege privilege="Add/Edit substore"><b><a href="#" onclick="ACT.go('subStoreIssueItem.form');"><spring:message code="inventory.substore.issueItemPatient"/></a></b></openmrs:hasPrivilege>
<openmrs:hasPrivilege privilege="Drug/Item Dispense"><b><a href="#" onclick="ACT.go('subStoreIssueItemPatientList.form');"><spring:message code="inventory.substore.listItemPatient"/></a></b></openmrs:hasPrivilege>
<openmrs:hasPrivilege privilege="Add/Edit substore">|&nbsp;<b><a href="#" onclick="ACT.go('subStoreListItemPatient.form');"><spring:message code="inventory.substore.listPatientItem"/></a></b></openmrs:hasPrivilege>
<openmrs:hasPrivilege privilege="Add/Edit substore">|&nbsp;<b><a href="#" onclick="ACT.go('subStoreIndentItemList.form');"><spring:message code="inventory.substore.indentItem"/></a></b></openmrs:hasPrivilege>
<openmrs:hasPrivilege privilege="Add/Edit substore">|&nbsp;<b><a href="#" onclick="ACT.go('subStoreIssueItemList.form');"><spring:message code="inventory.substore.issueItem"/></a></b></openmrs:hasPrivilege>
<openmrs:hasPrivilege privilege="Add/Edit substore">|&nbsp;<b><a href="#" onclick="ACT.go('itemViewStockBalanceSubStore.form');"><spring:message code="inventory.substoreItem.viewitemStockBalance"/></a></b></openmrs:hasPrivilege>

<br/><br/>


