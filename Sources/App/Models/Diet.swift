import Vapor
import Fluent

final class Diet: Model {
    
    // Schema
    static var schema = "diet"
    // Properties
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Field(key: "id_user")
    var id_user: Int
    
    @Field(key: "id_goal")
    var id_goal: Int
    
    @Field(key: "daily_protein")
    var daily_protein: Int
    
    @Field(key: "daily_fat")
    var daily_fat: Int
    
    @Field(key: "daily_carbs")
    var daily_carbs: Int
    
    @Field(key: "daily_calories")
    var daily_calories: Int
    
    @Field(key: "current")
    var current: Bool
    
    @Timestamp(key: "created_at", on: .create, format: .default)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update, format: .default)
    var updatedAt: Date?
    
    @Parent(key: "id_user")
    var user: User
    
    //@Siblings(through: DietDetail.self, from: \.$diet, to: \.$recipe)
    //var recipes: [Recipe]
    
    // Inits
    init() { }
    
    init(id: Int? = nil, id_user: Int, id_goal: Int, daily_protein: Int, daily_fat: Int, daily_carbs: Int, daily_calories: Int,current: Bool, createdAt: Date? = nil, updatedAt: Date? = nil) {
        self.id = id
        self.id_user = id_user
        self.id_goal = id_goal
        self.daily_protein = daily_protein
        self.daily_fat = daily_fat
        self.daily_carbs = daily_carbs
        self.daily_calories = daily_calories
        self.current =  current
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
