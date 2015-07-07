package taller

class UsuarioTagLib {

	def loginControl = {
		if(session.user){
			//out << "Usuario: ${session.user.login} "
			out << """||${link(action:"logout", controller:"usuario"){"Logout"}}"""
		} else {
			out << """[${link(action:"login", controller:"usuario"){"Login"}}]"""
		}
	}
}

