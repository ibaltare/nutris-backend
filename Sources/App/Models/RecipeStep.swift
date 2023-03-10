import Vapor
import Fluent

final class RecipeStep: Model {
    
    // Schema
    static var schema = "recipe_steps"
    // Properties
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Field(key: "id_recipe")
    var id_recipe: Int
    
    @Field(key: "step")
    var step: Int
    
    @Field(key: "description")
    var description: String
    
    @Parent(key: "id_recipe")
    var recipe: Recipe
    
    // Inits
    init() { }
}
