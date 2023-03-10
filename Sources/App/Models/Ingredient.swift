import Vapor
import Fluent

final class Ingredient: Model {
    
    // Schema
    static var schema = "ingredients"
    // Properties
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Field(key: "id_recipe")
    var id_recipe: Int
    //@Parent(key: "id_recipe")
    //var id_recipe: Recipe
    
    @Field(key: "ingredient")
    var ingredient: String
    
    @Field(key: "amount")
    var amount: String
    
    @Parent(key: "id_recipe")
    var recipe: Recipe
    
    // Inits
    init() { }
    
    /*init(id: Int? = nil, id_recipe: Recipe, ingredient: String, amount: String) throws {
        self.id = id
        self.$id_recipe.id = try id_recipe.requireID()
        self.ingredient = ingredient
        self.amount = amount
    }*/
}
