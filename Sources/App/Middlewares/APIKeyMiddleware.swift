import Vapor

final class APIKeyMiddleware: AsyncMiddleware {
    
    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        
        // Get API Key
        guard let apiKey = request.headers.first(name: "Nts-ApiKey") else {
            throw Abort(
                HTTPResponseStatus(statusCode: 409, reasonPhrase: "Missing API Key"),
                reason: "Nts-ApiKey header is missing.")
        }
        
        // Get API from Environment
        guard let envApiKey = Environment.process.API_KEY else {
            throw Abort(.failedDependency)
        }
        
        guard apiKey == envApiKey else {
            throw Abort(.unauthorized, reason: "Invalid API Key")
        }
        
        return try await next.respond(to: request)
        
    }
    
}
