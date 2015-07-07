class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		
		// "/"(view: "index")
		"/"(controller: "index", action: "userVerify")
		//System.out.println("paso ");
				
		"500"(view:'/error')
	}
}
