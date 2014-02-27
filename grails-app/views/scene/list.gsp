
<%@ page import="cranedata.Scene" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'scene.label', default: 'Scene')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-scene" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
                <li><span class="btitle"><g:message code="default.list.label" args="[entityName]" /></span></li>
			</ul>
		</div>
		<div id="list-scene" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                        <g:sortableColumn property="name" title="${message(code: 'scene.name.label', default: 'Name')}" />

                        <g:sortableColumn property="address" title="${message(code: 'scene.address.label', default: 'Address')}" />
					
						  <g:sortableColumn property="description" title="${message(code: 'scene.description.label', default: 'Description')}" />
					  <th>操作</th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${sceneInstanceList}" status="i" var="sceneInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>${fieldValue(bean: sceneInstance, field: "name")}</td>

                        <td><g:link action="show" id="${sceneInstance.id}">${fieldValue(bean: sceneInstance, field: "address")}</g:link></td>
					
						<td>${fieldValue(bean: sceneInstance, field: "description")}</td>
					    <td>
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${sceneInstance?.id}" />
                                    <g:link class="edit" action="edit" id="${sceneInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </fieldset>
                            </g:form>
					    </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sceneInstanceTotal}" />
                <div class="nav" role="navigation">
                    <ul>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
			</div>
		</div>
	</body>
</html>
