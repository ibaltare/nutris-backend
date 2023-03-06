import Vapor
import Fluent

final class UserAllergy: Model {
    // Schema
    static var schema = "user_allergies"
    // Properties
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Field(key: "id_user")
    var id_user: Int
    
    @Field(key: "id_allergy")
    var id_allergy: Int
    
    // Inits
    init() { }
    
    init(id: Int? = nil, id_user: Int, id_allergy: Int) {
        self.id = id
        self.id_user = id_user
        self.id_allergy = id_allergy
    }
    
}
