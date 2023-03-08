import Vapor

struct UserController: RouteCollection {
    
    // MARK: - Override
    func boot(routes: RoutesBuilder) throws {
        routes.group(JWTToken.authenticator(), JWTToken.guardMiddleware(), TokenMiddleware()) { builder in
            builder.get("profile", use: profile)
        }
    }
    
    func profile(req: Request) async throws -> User.Public {
        let token = try req.auth.require(JWTToken.self)
        // Get user id
        guard let user = try await User.find(Int(token.sub.value), on: req.db) else {
            throw Abort(.unauthorized)
        }
        
        return User.Public(
            id: user.id ?? 0,
            fullname: user.fullname,
            email: user.email,
            age: user.age,
            gender: user.gender,
            weight: user.weight,
            height: user.height,
            photo: user.photo_path,
            countryId: user.id_country,
            goalId: user.id_goal,
            activityId: user.id_activity)
    }
    
}
