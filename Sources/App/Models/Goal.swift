import Vapor
import Fluent

final class Goal: Model, Content {
    // Schema
    static var schema = "goals"
    // Properties
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Field(key: "goal")
    var goal: String
    
    // Inits
    init() { }
}
