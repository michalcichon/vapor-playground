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

drop.get("beers", Int.self) { request, beers in
    return try JSON(node: [
        "message" : "Give me \(beers) beers"
        ]);
}

drop.resource("posts", PostController())

drop.run()
