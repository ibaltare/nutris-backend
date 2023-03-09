import Vapor
import Fluent

final class User: Model {
    
    // Schema
    static var schema = "users"
    // Properties
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Field(key: "fullname")
    var fullname: String
    
    @Field(key: "email")
    var email: String
    
    @Field(key: "password")
    var password: String
    
    @Field(key: "age")
    var age: Int
    
    @Field(key: "gender")
    var gender: String
    
    @Field(key: "weight")
    var weight: Float
    
    @Field(key: "height")
    var height: Int
    
    @Field(key: "profile_photo_path")
    var photo_path: String
    
    @Field(key: "id_country")
    var id_country: Int
    
    @Field(key: "id_goal")
    var id_goal: Int
    
    @Field(key: "id_activity")
    var id_activity: Int
    
    @Field(key: "accept_terms")
    var accept_terms: Bool
    
    @Timestamp(key: "created_at", on: .create, format: .default)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update, format: .default)
    var updatedAt: Date?
    
    @Children(for: \.$user)
    var diet: [Diet]
    
    // Inits
    init() { }
    
    init(id: Int? = nil, fullname: String, email: String, password: String, age: Int, gender: String, weight: Float, height: Int, photo_path: String, id_country: Int, id_goal: Int, id_activity: Int, accept_terms: Bool, createdAt: Date? = nil, updatedAt: Date? = nil) {
        self.id = id
        self.fullname = fullname
        self.email = email
        self.password = password
        self.age = age
        self.gender = gender
        self.weight = weight
        self.height = height
        self.photo_path = photo_path
        self.id_country = id_country
        self.id_goal = id_goal
        self.id_activity = id_activity
        self.accept_terms = accept_terms
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

//MARK: user DTOs
extension User {
    
    struct Create: Content, Validatable {
        let fullname: String
        let email: String
        var password: String
        let age: Int
        let gender: String
        let weight: Float
        let height: Int
        let photo: String
        let ext: String
        let countryId: Int
        let goalId: Int
        let activityId: Int
        let terms: Bool
        let allergies: [Allergies]
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("fullname", as: String.self, is: !.empty, required: true)
            validations.add("email", as: String.self, is: .email, required: true)
            validations.add("password", as: String.self, is: .count(6...), required: true)
            validations.add("ext", as: String.self, is: .empty || .in(["png","jpg","jpeg"]), required: false)
            validations.add("age", as: Int.self, is: .range(12...), required: true)
            validations.add("gender", as: String.self, is: !.empty, required: true)
            validations.add("weight", as: Float.self, required: true)
            validations.add("height", as: Int.self, required: true)
            validations.add("countryId", as: Int.self, required: true)
            validations.add("goalId", as: Int.self, required: true)
            validations.add("activityId", as: Int.self, required: true)
            validations.add("terms", as: Bool.self, required: true)
            
        }
    }
    
    struct Allergies: Content {
        let id: Int
    }
    
    struct SignIn: Content, Validatable {
        
        let email: String
        let password: String
        
        static func validations(_ validations: inout Validations) {
            validations.add("email", as: String.self, is: .email, required: true)
            validations.add("password", as: String.self, is: !.empty, required: true)
        }
    }
    
    struct Public: Content {
        let id: Int
        let fullname: String
        let email: String
        let age: Int
        let gender: String
        let weight: Float
        let height: Int
        let photo: String
        let countryId: Int
        let goalId: Int
        let activityId: Int
    }
}

// MARK: - Authenticable
extension User: ModelAuthenticatable {
    
    static var usernameKey = \User.$email
    static var passwordHashKey = \User.$password
    
    func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.password)
    }
}
