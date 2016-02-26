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
<center><openmrs:hasPrivilege privilege="Add/Edit substore"><b>Drug&nbsp;| <a href="#" onclick="ACT.go('subStoreIssueItem.form');">Item </a></b></openmrs:hasPrivilege></center>
<center><openmrs:hasPrivilege privilege="Drug/Item Dispense"><b>Drug&nbsp;| <a href="#" onclick="ACT.go('subStoreIssueItemPatientList.form');">Item </a></b></openmrs:hasPrivilege></center>

<br/><br/>




<openmrs:hasPrivilege privilege="Drug order queue"><b><a href="#" onclick="ACT.go('patientQueueDrugOrder.form');"><spring:message code="inventory.substore.patientQueueForDrugOrders"/></a></b></openmrs:hasPrivilege>
<openmrs:hasPrivilege privilege="Drug/Item Dispense"><b><a href="#" onclick="ACT.go('subStoreIssueDrugList.form');"><spring:message code="inventory.substore.listDrugPatient"/></a></b></openmrs:hasPrivilege>&nbsp;
<openmrs:hasPrivilege privilege="Add/Edit substore">|&nbsp;<b><a href="#" onclick="ACT.go('subStoreListPatient.form');"><spring:message code="inventory.substore.listPatient"/></a></b></openmrs:hasPrivilege>&nbsp;
<openmrs:hasPrivilege privilege="Add/Edit substore">|&nbsp;<b><a href="#" onclick="ACT.go('subStoreIssueDrugForm.form');"><spring:message code="inventory.substore.issueDrugPatient"/></a></b></openmrs:hasPrivilege>&nbsp;
<openmrs:hasPrivilege privilege="Add/Edit substore">|&nbsp;<b><a href="#" onclick="ACT.go('subStoreIssueDrugAccountList.form');"><spring:message code="inventory.substore.issueDrugAccount"/></a></b></openmrs:hasPrivilege>&nbsp;
<openmrs:hasPrivilege privilege="Add/Edit substore">|&nbsp;<b><a href="#" onclick="ACT.go('subStoreIndentDrugList.form');"><spring:message code="inventory.substore.indentDrug"/></a></b></openmrs:hasPrivilege>&nbsp;
<openmrs:hasPrivilege privilege="Add/Edit substore">|&nbsp;<b><a href="#" onclick="ACT.go('viewStockBalanceSubStore.form');"><spring:message code="inventory.viewStockBalance"/></a></b></openmrs:hasPrivilege>&nbsp;
<openmrs:hasPrivilege privilege="Add/Edit substore">|&nbsp;<b><a href="#" onclick="ACT.go('viewStockBalanceExpiry.form');"><spring:message code="inventory.viewStockBalanceExpiry"/></a></b></openmrs:hasPrivilege>&nbsp;
<br/><br/>

<!--  15-june-2013 New Requirement #1636 User is able to see and dispense drugs in patient queue for issuing drugs, as ordered from dashboard -->
<!--  17-Nov-2014 In order to change the order of the sub menues-->



