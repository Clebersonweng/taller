<!DOCTYPE html>

<!--[if (gt IE 9)|!(IE)]><!-->

<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<title><g:layoutTitle default="ISP-PROG-WEB" /></title>
<g:layoutHead />
<r:layoutResources />
<style type="text/css">
#footer {
	margin-top: 20%
}
</style>

</head>
<body>
	<div id="wrap">
		<div id="main" class="container clear-top">
			<div class="container">
				<div class="container-fluid">
					<!-- agrego el menu -->
					<g:render template="/compartido/menu" />


					<g:if test="${flash.message}">
						<div class="span4">
							<div class="alert alert-errors" role="status">
								<h4 class="alert-heading">Atención! Usuario ${session.user?.login}</h4>
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								${flash.message}
							</div>
						</div>
					</g:if>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>


					<div style="text-align: center" id="home" role="banner">
						<a><img src="${resource(dir: 'images', file: 'taller.jpg')}" /></a>
					</div>
					<!-- INSERTAR IMAGEN AQUI -->

					<g:render template="/compartido/footer" />
				</div>

			</div>
		</div>
	</div>
	<r:layoutResources />
</body>
</html>
