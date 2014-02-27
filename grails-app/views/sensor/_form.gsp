<%@ page import="cranedata.Sensor" %>
<meta name="layout" content="admin">

<div class="fieldcontain ${hasErrors(bean: sensorInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="sensor.name.label" default="Name" />

    </label>
    <g:textField name="name" value="${sensorInstance?.name}"/>
</div>
<div class="fieldcontain  ${hasErrors(bean: sensorInstance, field: 'channel', 'error')} required">
	<label for="channel">
		<g:message code="sensor.channel.label" default="Channel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="channel" name="channel.id" from="${cranedata.Channel.list()}" optionKey="id" required="" value="${sensorInstance?.channel?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sensorInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="sensor.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" value="${sensorInstance?.description}"/>
</div>



