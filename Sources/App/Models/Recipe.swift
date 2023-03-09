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
    var proteins: String
    
    @Field(key: "fats")
    var fats: String
    
    @Field(key: "carbs")
    var carbs: String
    
    @Field(key: "calories")
    var calories: String
    
    @Timestamp(key: "created_at", on: .create, format: .default)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update, format: .default)
    var updatedAt: Date?
    
    // Inits
    init() { }
}
