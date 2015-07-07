<ul class="nav nav-tabs">
	<li id="submenu_list">
		<g:link controller="${controllerName}" action="list">
			Listar
  		</g:link>
  	</li>
	<li id="submenu_create">
		<g:link  controller="${controllerName}" action="create">
			Crear
  		</g:link>
	</li>
</ul>

<!-- js para activar/desactivar submenu -->
<g:javascript>
	if("${actionName}"===""){
		$("#submenu_list").removeClass("active");
		$("#submenu_create").removeClass("active");
	}else{	
		$("#submenu_${actionName}").addClass("active");
	}
</g:javascript>