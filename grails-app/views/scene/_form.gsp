<%@ page import="cranedata.Scene" %>
<meta name="layout" content="admin">

<div class="fieldcontain ${hasErrors(bean: sceneInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="scene.name.label" default="Name" />

    </label>
    <g:textField name="name" value="${sceneInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sceneInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="scene.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${sceneInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sceneInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="scene.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" value="${sceneInstance?.description}"/>
</div>


