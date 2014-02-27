<%@ page import="cranedata.Channel" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin">
    <g:set var="entityName" value="${message(code: 'channel.label', default: 'Channel')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-channel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="show-channel" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list channel">
        <g:if test="${channelInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="channel.name.label" default="Name" /></span>
                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${channelInstance}" field="name"/></span>
            </li>
        </g:if>
        <g:if test="${channelInstance?.device}">
            <li class="fieldcontain">
                <span id="device-label" class="property-label"><g:message code="channel.device.label" default="Device" /></span>
                <span class="property-value" aria-labelledby="device-label"><g:link controller="device" action="show" id="${channelInstance?.device?.id}">${channelInstance?.device?.encodeAsHTML()}</g:link></span>
            </li>
        </g:if>
    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${channelInstance?.id}" />
            <g:link class="edit" action="edit" id="${channelInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
