<!DOCTYPE html>

<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="ISP-PROG-WEB" /></title>
<g:layoutHead />
<g:javascript library="jquery" plugin="jquery"/>
<r:require modules="bootstrap"/>
<r:layoutResources />
<style type="text/css">
 #footer{margin-top: 20%}
</style>
</head>
<body>

	<div id="wrap">
		<div id="main" class="container clear-top">

			<div class="container">
				<div class="container-fluid">
					<!-- agrego el menu -->
					<g:render template="/compartido/menu" />
					<div class="row-fluid">
					<!-- le ubico donde quiero que aparesca mi submenu -->
						<div class="span2 offset4">
							<!-- agrego el submenu -->
							<g:render template="/compartido/submenu" />
						</div>
						<div class="span10 offset1">
							<g:layoutBody />
						</div>
					</div>
					<!-- aqui va el footer -->
				</div>
			</div>
		</div>
	</div>
	<g:javascript library="application" />

	<r:layoutResources />
</body>
</html>

