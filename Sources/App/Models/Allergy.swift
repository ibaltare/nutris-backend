import Vapor
import Fluent

final class Allergy: Model, Content {
    // Schema
    static var schema = "allergies"
    // Properties
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Field(key: "allergy")
    var allergy: String
    
    // Inits
    init() { }
}
