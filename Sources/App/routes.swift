import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    try app.group("v1"){ builder in
        try builder.group(APIKeyMiddleware()) { builder in
            try builder.group("users"){ builder in
                try builder.register(collection: RegisterController())
                try builder.register(collection: AuthController())
                try builder.register(collection: UserController())
            }
            try builder.group("cat"){ builder in
                try builder.register(collection: CatalogueController())
            }
            try builder.register(collection: RecipeController())
        }
    }
}
