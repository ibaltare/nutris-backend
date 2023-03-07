import Vapor
import Fluent

final class Country: Model, Content {
    // Schema
    static var schema = "countries"
    // Properties
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Field(key: "code")
    var code: String
    
    @Field(key: "country")
    var country: String
    
    // Inits
    init() { }
}
