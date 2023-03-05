import Vapor

struct RegisterController: RouteCollection {
    
    // MARK: - Override
    func boot(routes: RoutesBuilder) throws {
        routes.on(.POST, "register", body: .collect(maxSize: "10mb"), use: userRegister)
        //routes.post("register", use: userRegister)
    }
    
    // MARK: - Routes
    func userRegister(req: Request) async throws -> Credentials {
        // Validate
        try User.Create.validate(content: req)
        // Decode user data
        var userCreate = try req.content.decode(User.Create.self)
        userCreate.password = try req.password.hash(userCreate.password)
        
        try await req.fileio.writeFile(
            ByteBuffer(string: userCreate.photo),
            at: "Public/imageProfile/test.\(userCreate.ext)")
        
        print(userCreate)
        return Credentials(refreshToken: "refresh", accessToken: "access")
    }
    
}
