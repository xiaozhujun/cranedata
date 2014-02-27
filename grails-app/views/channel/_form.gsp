<%@ page import="cranedata.Channel" %>
<meta name="layout" content="admin">
<div class="fieldcontain ${hasErrors(bean: channelInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="channel.name.label" default="Name" />
    </label>
    <g:textField name="name" value="${channelInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: channelInstance, field: 'device', 'error')} required">
    <label for="device">
        <g:message code="channel.device.label" default="Device" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="device" name="device.id" from="${cranedata.Device.list()}" optionKey="id" required="" value="${channelInstance?.device?.id}" class="many-to-one"/>
</div>





