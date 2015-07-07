<%@ page import="taller.login.Usuario" %>




<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'login', 'error')} required">
		<label  class="control-label" for="login">
		<span class="required-indicator">*</span>
			<g:message code="usuario.login.label" default="Login:" />			
			</label><div class="controls">
			<g:textField name="login" value="${usuarioInstance?.login}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
		<label  class="control-label" for="password">
		<span class="required-indicator">*</span>
			<g:message code="usuario.password.label" default="Password:" />			
			</label><div class="controls">
			<g:field type="password" name="password" value="${usuarioInstance?.password}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'role', 'error')} required">
		<label  class="control-label" for="role">
		<span class="required-indicator">*</span>
			<g:message code="usuario.role.label" default="Role:" />			
			</label><div class="controls">
			<g:select name="role" from="${usuarioInstance.constraints.role.inList}" value="${usuarioInstance?.role}" valueMessagePrefix="usuario.role" noSelection="['': '']"/>
		</div>
	</div>
</div>

