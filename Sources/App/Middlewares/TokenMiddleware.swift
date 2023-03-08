import Vapor

final class TokenMiddleware: AsyncMiddleware {
    
    func respond(to req: Request, chainingTo next: AsyncResponder) async throws -> Response {
        // Get refresh token
        let token = try req.auth.require(JWTToken.self)
        // Verify type of JWT
        guard token.type == .access else {
            throw Abort(.unauthorized, reason: "Invalid Token Type")
        }
        
        return try await next.respond(to: req)
    }
}
