
<%@ page import="cranedata.Device" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin">
    <g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-device" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="show-device" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list device">
        <g:if test="${deviceInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="device.name.label" default="Name" /></span>
                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${deviceInstance}" field="name"/></span>
            </li>
        </g:if>
        <g:if test="${deviceInstance?.dnumber}">
            <li class="fieldcontain">
                <span id="dnumber-label" class="property-label"><g:message code="device.dnumber.label" default="Dnumber" /></span>
                <span class="property-value" aria-labelledby="dnumber-label"><g:fieldValue bean="${deviceInstance}" field="dnumber"/></span>
            </li>
        </g:if>
        <g:if test="${deviceInstance?.scene}">
            <li class="fieldcontain">
                <span id="scene-label" class="property-label"><g:message code="device.scene.label" default="Scene" /></span>
                <span class="property-value" aria-labelledby="scene-label"><g:link controller="scene" action="show" id="${deviceInstance?.scene?.id}">${deviceInstance?.scene?.encodeAsHTML()}</g:link></span>
            </li>
        </g:if>

        <g:if test="${deviceInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="device.description.label" default="Description" /></span>
                <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${deviceInstance}" field="description"/></span>
            </li>
        </g:if>
    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${deviceInstance?.id}" />
            <g:link class="edit" action="edit" id="${deviceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
