
<%@ page import="cranedata.Sensor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'sensor.label', default: 'Sensor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sensor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
                <li><span class="btitle"><g:message code="default.list.label" args="[entityName]" /></span></li>
			</ul>
		</div>
		<div id="list-sensor" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                        <g:sortableColumn property="name" title="${message(code: 'sensor.name.label', default: 'Name')}" />

                        <th><g:message code="sensor.channel.label" default="Channel" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'sensor.description.label', default: 'Description')}" />
					
					    <th>
                        操作
					    </th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${sensorInstanceList}" status="i" var="sensorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>${fieldValue(bean: sensorInstance, field: "name")}</td>

                        <td><g:link action="show" id="${sensorInstance.id}">${fieldValue(bean: sensorInstance, field: "channel")}</g:link></td>
					
						<td>${fieldValue(bean: sensorInstance, field: "description")}</td>
					
					    <td>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${sensorInstance?.id}" />
                                    <g:link class="edit" action="edit" id="${sensorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </fieldset>
                            </g:form>
					    </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sensorInstanceTotal}" />
                <div class="nav" role="navigation">
                    <ul>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
			</div>
		</div>
	</body>
</html>
