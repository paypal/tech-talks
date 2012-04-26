<!--- CF_PayFlowPro v1.4
	Written by Ryan Stille, CF WebTools.
	Based on code discussed on this blog post:
	http://www.dervishmoose.com/blog/index.cfm/2008/3/10/Drop-in-replacement-for-CFXPAYFLOWPRO-on-ColdFusion-8

	Me:
	http://www.stillnetstudios.com
	http://www.cfwebtools.com
	Please send me feedback at ryan@cfwebtools.com. 

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
--->

<!--- defalult a few parameters that were required in the old CFX_PayFloPro --->
<cfparam name="Attributes.term" default="0">  <!--- 0 means payments should continue until deactivated. --->
<cfparam name="Attributes.vendor" default="#Attributes.user#"> <!--- PayPal says vendor should be the same as the user unless a Payflow Pro USER was created --->
<cfparam name="Attributes.requestID" default="#CreateUUID()#">
<cfparam name="Attributes.hostport" default="443">

<cfif Attributes.vendor EQ "">
	<cfset Attributes.vendor = Attributes.user>
</cfif>

<cfset ParmList = "">
<cfloop list="TRXTYPE,TENDER,PARTNER,VENDOR,USER,PWD,ACCT,EXPDATE,AMT,CVV2,COMMENT1,COMMENT2,ACTION,EMAIL,NAME,STREET,CITY,STATE,ZIP,START,PROFILENAME,PAYPERIOD,OPTIONALTRX,OPTIONALTRXAMT,IP,PHONENUM,TERM,ORIGPROFILEID,ORIGID,ABA,ACCTTYPE" index="field">
	<cfif StructKeyExists(Attributes,field) AND Len(Attributes[field])>
		<cfif Len(ParmList)>
			<cfset ParmList = ParmList & "&">
		</cfif>
		<cfset ParmList = ParmList & "#field#[#len(attributes[field])#]=#Attributes[field]#">
	</cfif>
</cfloop>

<!--- old CFX_PayFlowPro implementations may be using the old hostnames --->
<cfif Attributes.hostaddress EQ "test-payflow.verisign.com">
    <cfset Attributes.hostaddress = "pilot-payflowpro.paypal.com">
<cfelseif Attributes.hostaddress EQ "payflow.verisign.com">
    <cfset Attributes.hostaddress = "payflowpro.paypal.com">
</cfif>

<cfhttp method="POST" url="https://#Attributes.hostaddress#/transaction" resolveurl="no" timeout="#Attributes.TIMEOUT#" port="#Attributes.HOSTPORT#">
   <cfhttpparam type="header" name="Content-Type" VALUE="text/namevalue">
   <cfhttpparam type="header" name="Content-Length" VALUE="#Len(ParmList)#">
   <cfhttpparam type="header" name="Host" value="#Attributes.hostaddress#">
   <cfhttpparam type="header" name="X-VPS-REQUEST-ID" VALUE="#Attributes.requestID#">
   <cfhttpparam type="header" name="X-VPS-CLIENT-TIMEOUT" VALUE="#Attributes.TIMEOUT#">
   <cfhttpparam type="header" name="X-VPS-VITCLIENTCERTIFICATION-ID" VALUE="#Attributes.PARTNER##Attributes.USER#">
   <cfhttpparam type="body" value="#ParmList#">
</cfhttp>

<cfset tmpResponse = QueryNew("")>
<cfset QueryAddRow(tmpResponse, 1)>

<cfloop list="#cfhttp.FileContent#" index="i" delimiters="&">
	<!--- <cfset QueryAddColumn(tmpResponse, listfirst(i,'=') , ListToArray(listlast(i,"=")))> --->
	<cfset QueryAddColumn(tmpResponse, Replace(listfirst(i,'='), ' ', '_', 'all') , ListToArray(listlast(i,"=")))>
</cfloop>

<cfset QueryAddColumn(tmpResponse, 'RESULTSTR' , ListToArray(cfhttp.FileContent))>
<cfset QueryAddColumn(tmpResponse, 'PARMLIST' , ListToArray(ParmList))>

<cfset "caller.#Attributes.Query#" = tmpResponse>