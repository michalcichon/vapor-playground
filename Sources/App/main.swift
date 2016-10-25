import Vapor

let drop = Droplet()

drop.get { request in
    return try JSON(node: [
        "message" : "Hello"
        ]);
}

drop.get("test") { request in
    return try JSON(node: [
        "message" : "Test"
        ]);
}

drop.resource("posts", PostController())

drop.run()
