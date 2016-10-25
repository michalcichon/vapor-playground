import Vapor

let drop = Droplet()

drop.get { request in
    return "Hello"
}

drop.resource("posts", PostController())

drop.run()
