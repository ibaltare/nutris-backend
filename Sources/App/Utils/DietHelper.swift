import Foundation
import FluentKit
import Vapor

struct DietHelper {
    
    static func createDiet(userID: Int, goalID: Int, db: Database) async throws{
        let diet = Diet(id_user: userID, id_goal: goalID, daily_protein: 90, daily_fat: 50, daily_carbs: 80, daily_calories: 1800, current: true)
        try await diet.create(on: db)
        
        try await Food.query(on: db).all().forEach{ food in
            Task {
                let num = try await Recipe.query(on: db).count()
                let recipe = try await Recipe.find(Int.random(in: 1..<(num+1)), on: db)
                try await DietDetail(diet: diet, id_food: food.id!, recipe: recipe!).create(on: db)
            }
        }
    }
    
}
