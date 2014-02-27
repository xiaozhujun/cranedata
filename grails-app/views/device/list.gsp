
<%@ page import="cranedata.Device" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin">
    <g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-device" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><span class="btitle"><g:message code="default.list.label" args="[entityName]" /></span></li>
    </ul>
</div>
<div id="list-device" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="name" title="${message(code: 'device.name.label', default: 'Name')}" />

            <g:sortableColumn property="dnumber" title="${message(code: 'device.dnumber.label', default: 'Dnumber')}" />

            <th><g:message code="device.scene.label" default="Scene" /></th>

            <g:sortableColumn property="description" title="${message(code: 'device.description.label', default: 'Description')}" />
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${deviceInstanceList}" status="i" var="deviceInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${fieldValue(bean: deviceInstance, field: "name")}</td>

                <td>${fieldValue(bean: deviceInstance, field: "dnumber")}</td>

                <td>${fieldValue(bean: deviceInstance, field: "scene")}</td>

                <td><g:link action="show" id="${deviceInstance.id}">${fieldValue(bean: deviceInstance, field: "description")}</g:link></td>
                <td>
                    <g:form>
                        <fieldset class="buttons">
                            <g:hiddenField name="id" value="${deviceInstance?.id}" />
                            <g:link class="edit" action="edit" id="${deviceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </fieldset>
                    </g:form>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${deviceInstanceTotal}" />
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
