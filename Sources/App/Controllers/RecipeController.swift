import Vapor

struct RecipeController: RouteCollection {
    
    // MARK: - Override
    func boot(routes: RoutesBuilder) throws {
        routes.group(JWTToken.authenticator(), JWTToken.guardMiddleware(), TokenMiddleware()) { builder in
            builder.get("dashboard", use: dashboard)
            builder.get("recipe",":id", use: recipeDetail)
        }
    }
    
    func dashboard(req: Request) async throws -> String {
        return "ok"
    }
    
    func recipeDetail(req: Request) async throws -> String {
        let id = req.parameters.get("id", as: Int.self)
        return "ok"
    }
}
