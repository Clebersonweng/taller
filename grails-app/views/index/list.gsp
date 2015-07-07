

<%@ page import="taller.index.Index" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'index.label', default: 'Index')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	
				<div id="list-index"
					class="content scaffold-list" role="main">
					<fieldset>
						<legend>
							<g:message code="default.list.label" args="[entityName]" />
						</legend>
					</fieldset>


					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<table class="table table-striped">
						<thead>
							<tr>
								
							</tr>
						</thead>
						<tbody>
							<g:each in="${indexInstanceList}" status="i"
								var="indexInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${indexInstanceTotal}" />
					</div>
				</div>
		
</body>
</html>
