
<%@ page import="cranedata.Sensor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'sensor.label', default: 'Sensor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sensor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-sensor" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sensor">
                <g:if test="${sensorInstance?.name}">
                    <li class="fieldcontain">
                        <span id="name-label" class="property-label"><g:message code="sensor.name.label" default="Name" /></span>

                        <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${sensorInstance}" field="name"/></span>

                    </li>
                </g:if>
				<g:if test="${sensorInstance?.channel}">
				<li class="fieldcontain">
					<span id="channel-label" class="property-label"><g:message code="sensor.channel.label" default="Channel" /></span>
					
						<span class="property-value" aria-labelledby="channel-label"><g:link controller="channel" action="show" id="${sensorInstance?.channel?.id}">${sensorInstance?.channel?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sensorInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="sensor.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${sensorInstance}" field="description"/></span>
					
				</li>
				</g:if>
			

			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${sensorInstance?.id}" />
					<g:link class="edit" action="edit" id="${sensorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
