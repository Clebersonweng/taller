package taller.login


class Usuario {
	static constraints = {
		login(unique:true)
		password(password:true)
		role(inList:["mecanico", "administrador"])
	  }
	
	//  static hasMany = [entries:Entry]
	
	  String login
	  String password
	  String role = "mecanico"
	
	  String toString(){
		login
	  }
}
