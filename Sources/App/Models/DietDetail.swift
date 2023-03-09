import Vapor
import Fluent

final class DietDetail: Model {
    
    // Schema
    static var schema = "diet_detail"
    // Properties
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Parent(key: "id_diet")
    var diet: Diet
    
    @Field(key: "id_food")
    var id_food: Int
    
    @Parent(key: "id_recipe")
    var recipe: Recipe
    
    @Timestamp(key: "date_at", on: .create, format: .default)
    var date_at: Date?
    
    // Inits
    init() { }
    
    init(id: Int? = nil, diet: Diet, id_food: Int, recipe: Recipe, date_at: Date? = nil) throws {
        self.id = id
        self.$diet.id = try diet.requireID()
        self.id_food = id_food
        self.$recipe.id = try recipe.requireID()
        self.date_at = date_at
    }
    
}
