<div class="navbar">
	<div class="navbar-inner">
		<ul class="nav">
			<li id="menu_home"><g:link controller="index" action="index"><i class="icon-home icon-white"></i> Home</a></g:link></li>

			<li id="menu_modelo"><g:link controller="modelo" action="index">Modelo</g:link></li>
			<li id="menu_cliente"><g:link controller="cliente" action="index">Cliente</g:link></li>
			<li id="menu_ordenDeServicio"><g:link controller="ordenDeServicio" >Orden de Servicio</g:link></li>
			<li id="menu_marca"><g:link controller="marca" action="index">Marca</g:link></li>
			<li id="menu_mecanico"><g:link controller="mecanico" action="index">Mecanico</g:link></li>
			<li id="menu_vehiculo"><g:link controller="vehiculo" action="index">Vehiculo</g:link></li>
			<li id="menu_repuesto"><g:link controller="repuesto" action="index">Repuesto</g:link></li>
			<li id="menu_usuario"><g:link controller="usuario" action="index">Registrar</g:link></li>
			<li id="menu_facturaMaestro"><g:link controller="facturaMaestro" action="index">Factura</g:link></li>
		</ul>	
		
		
	
			<div class="pull-right">
		                <ul class="nav pull-right">
		                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome,  ${session.user.login} <b class="caret"></b></a>
		                        <ul class="dropdown-menu">
		                            <li><a href="/user/preferences"><i class="icon-cog"></i> Preferences</a></li>
		                            <li><a href="/help/support"><i class="icon-envelope"></i> Contact Support</a></li>
		                            <li class="divider"></li>
		                            <li><a href="../usuario/logout"><i class="icon-off"></i>Logout
		                             </a> </li>
		                        </ul>

		                    </li>
		                </ul>
		    </div>
		</div>
</div>

<!-- js para activar/desactivar el menu -->
<g:javascript>
	if("${controllerName}"==="index"){
		$("#menu_home").addClass("active");
	}else{	
		$("#menu_${controllerName}").addClass("active");
	}
</g:javascript>