class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/admin")
        "/user"(view:"/user")
		"500"(view:'/error')
	}
}
