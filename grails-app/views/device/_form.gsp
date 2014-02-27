<%@ page import="cranedata.Device" %>
<meta name="layout" content="admin">
<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="device.name.label" default="Name" />

    </label>
    <g:textField name="name" value="${deviceInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'dnumber', 'error')} ">
    <label for="dnumber">
        <g:message code="device.dnumber.label" default="Dnumber" />

    </label>
    <g:textField name="dnumber" value="${deviceInstance?.dnumber}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'scene', 'error')} required">
    <label for="scene">
        <g:message code="device.scene.label" default="Scene" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="scene" name="scene.id" from="${cranedata.Scene.list()}" optionKey="id" required="" value="${deviceInstance?.scene?.id}" class="many-to-one"/>
</div>
<div class="fieldcontain ${hasErrors(bean: deviceInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="device.description.label" default="Description" />
    </label>
    <g:textArea name="description" value="${deviceInstance?.description}"/>
</div>
