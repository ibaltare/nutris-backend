import Vapor
import Fluent

final class Food: Model, Content {
    // Schema
    static var schema = "foods"
    // Properties
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Field(key: "food")
    var food: String
    
    // Inits
    init() { }
}
