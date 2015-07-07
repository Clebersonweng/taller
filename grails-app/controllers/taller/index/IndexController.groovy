package taller.index

import org.grails.datastore.gorm.finders.MethodExpression.IsEmpty;


class IndexController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def userVerify() {
		if( (session?.user == null) ){
			System.out.println ("verificando:  ");
			println ("Usuario"+session?.user);
			redirect(controller:"usuario", action:"login")
		}
		else {
			redirect(controller:"index", action:"index")
			println ("Se encontro un usuario:   "+session?.user);
		}
	}
	

	def index() {
		render(view:'index')
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[indexInstanceList: Index.list(params), indexInstanceTotal: Index.count()]
	}

	def create() {
		[indexInstance: new Index(params)]
	}
}
