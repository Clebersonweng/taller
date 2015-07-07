package taller.login

import org.apache.commons.lang.StringUtils
import org.springframework.dao.DataIntegrityViolationException

class UsuarioController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def beforeInterceptor = [action:this.&auth,
		except:[
			"login",
			"authenticate",
			"logout"
		]]

	def search(){
		def usuario = params.value.toString()
		def role = params.value.toString()
		def usuarios
		if(!StringUtils.isBlank(usuario) || !StringUtils.isBlank(role)){
			usuarios = Usuario.findAll("FROM Usuario WHERE login LIKE ? OR role LIKE ?", [
				"%"+usuario+"%",
				"%"+role+"%"
			])
			usuarios.toArray()
			println(usuarios)
		} else {
			usuarios = Usuario.list()
		}
		render(template:'tableresults', model:[usuarioInstanceList: usuarios])
	}

	def auth() {
		if((session.user == null)){
			redirect(controller: "usuario" , action: "login")
		} else
		if( !(session?.user?.role == "administrador") ){
			flash.message = "Solo tiene autorizacion para acceder a Orden de Servicio!."
			redirect(controller: "index", action: "index")
			return false
		}
	}

	def scaffold = Usuario

	def login = {}

	def authenticate = {
		def user = Usuario.findByLoginAndPassword(params.login, params.password)
		if(user){
			session.user = user
			flash.message = " ${user.login}!"
			redirect(uri: "/")
			//redirect(controller:"modelo", action:"list")
		}else{
			flash.message = "!  ${params.login}. Intente nuevamente."
			redirect(action:"login")
		}
	}

	def logout = {
		flash.message = "Goodbye ${session.user.login}"
		session.user = null
		redirect(controller:"usuario", action:"login")
	}


	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
	}

	def create() {
		[usuarioInstance: new Usuario(params)]
	}

	def save() {
		//def contrasenaEncrip = Usuario.password.hashCode()
		def usuarioInstance = new Usuario(params)
		if (!usuarioInstance.save(flush: true)) {
			render(view: "create", model: [usuarioInstance: usuarioInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'usuario.label', default: 'Usuario'),
			usuarioInstance.id
		])
		redirect(action: "list", id: usuarioInstance.id)
	}

	def show(Long id) {
		def usuarioInstance = Usuario.get(id)
		if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'usuario.label', default: 'Usuario'),
				id
			])
			redirect(action: "list")
			return
		}

		[usuarioInstance: usuarioInstance]
	}

	def edit(Long id) {
		def usuarioInstance = Usuario.get(id)
		if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'usuario.label', default: 'Usuario'),
				id
			])
			redirect(action: "list")
			return
		}

		[usuarioInstance: usuarioInstance]
	}

	def update(Long id, Long version) {
		def usuarioInstance = Usuario.get(id)
		if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'usuario.label', default: 'Usuario'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (usuarioInstance.version > version) {
				usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'usuario.label', default: 'Usuario')] as Object[],
						"Another user has updated this Usuario while you were editing")
				render(view: "edit", model: [usuarioInstance: usuarioInstance])
				return
			}
		}

		usuarioInstance.properties = params

		if (!usuarioInstance.save(flush: true)) {
			render(view: "edit", model: [usuarioInstance: usuarioInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'usuario.label', default: 'Usuario'),
			usuarioInstance.id
		])
		redirect(action: "list", id: usuarioInstance.id)
	}

	def delete(Long id) {
		def usuarioInstance = Usuario.get(id)
		if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'usuario.label', default: 'Usuario'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			usuarioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'usuario.label', default: 'Usuario'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'usuario.label', default: 'Usuario'),
				id
			])
			redirect(action: "list", id: id)
		}
	}
}
