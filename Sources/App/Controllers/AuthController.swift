import Vapor
import Fluent

struct AuthController: RouteCollection {
    
    // MARK: - Override
    func boot(routes: RoutesBuilder) throws {
        routes.group(User.authenticator(), User.guardMiddleware()) { builder in
            builder.post("login", use: signIn)
        }
        routes.group(JWTToken.authenticator(), JWTToken.guardMiddleware()) { builder in
            builder.get("refresh", use: refresh)
        }
    }
    
    func signIn(req: Request) async throws -> JWTToken.Public {
        // Get authenticated user
        let user = try req.auth.require(User.self)
        // JWT Tokens
        let tokens = JWTToken.generateTokens(userID: user.id!)
        let accessSigned = try req.jwt.sign(tokens.access)
        let refreshSigned = try req.jwt.sign(tokens.refresh)
        
        return JWTToken.Public(accessToken: accessSigned, refreshToken: refreshSigned)
    }
    
    func refresh(req: Request) async throws -> JWTToken.Public {
        // Get refresh token
        let token = try req.auth.require(JWTToken.self)
        // Verify type of JWT
        guard token.type == .refresh else {
            throw Abort(.methodNotAllowed)
        }
        // Get user id
        guard let user = try await User.find(Int(token.sub.value), on: req.db) else {
            throw Abort(.unauthorized)
        }
        // JWT Tokens
        let tokens = JWTToken.generateTokens(userID: user.id!)
        let accessSigned = try req.jwt.sign(tokens.access)
        let refreshSigned = try req.jwt.sign(tokens.refresh)
        
        return JWTToken.Public(accessToken: accessSigned, refreshToken: refreshSigned)
    }
}
