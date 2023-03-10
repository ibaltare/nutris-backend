import Vapor
import Fluent

final class Recipe: Model {
    // Schema
    static var schema = "recipes"
    // Properties
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "description")
    var description: String
    
    @Field(key: "preparation_time")
    var preparation_time: Int
    
    @Field(key: "photo_path")
    var photo_path: String
    
    @Field(key: "proteins")
    var proteins: Int
    
    @Field(key: "fats")
    var fats: Int
    
    @Field(key: "carbs")
    var carbs: Int
    
    @Field(key: "calories")
    var calories: Int
    
    @Field(key: "rating")
    var rating: Int
    
    @Timestamp(key: "created_at", on: .create, format: .default)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update, format: .default)
    var updatedAt: Date?
    
    //@Siblings(through: DietDetail.self, from: \.$recipe, to: \.$diet)
    //var diet: [Diet]
    
    @Children(for: \.$recipe)
    var ingredients: [Ingredient]
    
    @Children(for: \.$recipe)
    var steps: [RecipeStep]
    
    // Inits
    init() { }
}

extension Recipe {
    struct List: Content {
        let duration: Int
        let id: Int
        let title: String
        let desc: String
        let rating: Int
        let food: String
        let photo: String
    }
    
    struct Detail: Content {
        let duration: Int
        let id: Int
        let title: String
        let desc: String
        let rating: Int
        let photo: String
        let proteins: Int
        let fats: Int
        let carbs: Int
        let calories: Int
        let steps: [RecipeStep]
        let ingredients: [Ingredient]
    }
}
