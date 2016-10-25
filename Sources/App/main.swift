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

drop.post("post-hello") { request in
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest;
    }
    
    return try JSON(node: [
        "message" : "Hello \(name)"
    ])
}

drop.resource("posts", PostController())

drop.run()
