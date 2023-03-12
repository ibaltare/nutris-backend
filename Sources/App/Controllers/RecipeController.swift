import Vapor
import FluentSQL

struct RecipeController: RouteCollection {
    
    // MARK: - Override
    func boot(routes: RoutesBuilder) throws {
        routes.group(JWTToken.authenticator(), JWTToken.guardMiddleware(),TokenMiddleware()) { builder in
            builder.get("diet", use: dashboard)
            builder.get("recipe",":id", use: recipeDetail)
        }
    }
    
    func dashboard(req: Request) async throws -> [Recipe.List] {
        let token = try req.auth.require(JWTToken.self)
        // Get user id
        guard let user = try await User.find(Int(token.sub.value), on: req.db) else {
            throw Abort(.unauthorized)
        }
        
        try await user.$diet.load(on: req.db)
        guard let idDiet = user.diet[0].id else { throw Abort(.unauthorized) }
        
        let result = try await DietDetail.query(on: req.db)
            .join(Food.self, on: \DietDetail.$id_food == \Food.$id)
            .join(Recipe.self, on: \DietDetail.$recipe.$id == \Recipe.$id)
            .filter(DietDetail.self, \.$diet.$id == idDiet)
            .all()
        
        return try result.map{ row in
            let food = try row.joined(Food.self)
            let recipe = try row.joined(Recipe.self)
            return Recipe.List(
                duration: recipe.preparation_time,
                id: recipe.id!,
                title: recipe.name,
                desc: recipe.description,
                rating: recipe.rating,
                food: food.food,
                photo: recipe.photo_path
            )
        }
    }
    
    func recipeDetail(req: Request) async throws -> Recipe.Detail {
        let id = req.parameters.get("id", as: Int.self)
        guard let recipe = try await Recipe.find(id, on: req.db) else {
            throw Abort(.notFound)
        }
        try await recipe.$ingredients.load(on: req.db)
        try await recipe.$steps.load(on: req.db)
        
        return Recipe.Detail(
            duration: recipe.preparation_time, id: recipe.id!, title: recipe.name, desc: recipe.description, rating: recipe.rating, photo: recipe.photo_path, proteins: recipe.proteins, fats: recipe.fats, carbs: recipe.carbs, calories: recipe.calories, steps: recipe.steps, ingredients: recipe.ingredients)
    }
}
