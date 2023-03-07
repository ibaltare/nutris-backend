import Vapor
import Fluent

final class Activity: Model, Content {
    // Schema
    static var schema = "physical_activity"
    // Properties
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Field(key: "activity")
    var activity: String
    
    // Inits
    init() { }
}
