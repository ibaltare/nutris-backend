import Vapor

struct RegisterController: RouteCollection {
    
    // MARK: - Override
    func boot(routes: RoutesBuilder) throws {
        routes.on(.POST, "register", body: .collect(maxSize: "10mb"), use: userRegister)
    }
    
    // MARK: - Routes
    func userRegister(req: Request) async throws -> JWTToken.Public {
        // Validate
        try User.Create.validate(content: req)
        //transaction to save
        let userId = try await req.db.transaction { transaction in
            // Decode user data
            var userCreate = try req.content.decode(User.Create.self)
            userCreate.password = try req.password.hash(userCreate.password)
            //create photo name if exist
            let photo:String
            if !userCreate.photo.isEmpty && !userCreate.ext.isEmpty {
                photo = UUID().uuidString + ".\(userCreate.ext)"
            } else {
                if userCreate.gender.lowercased() == "male" {
                    photo = Constants.imageDefaultMan
                }else{
                    photo = Constants.imageDefaultWomen
                }
            }
            //create user model to save
            let user = User(
                fullname: userCreate.fullname,
                email: userCreate.email,
                password: userCreate.password,
                age: userCreate.age,
                gender: userCreate.gender,
                weight: userCreate.weight,
                height: userCreate.height,
                photo_path: Constants.profileImagePath + photo,
                id_country: userCreate.countryId,
                id_goal: userCreate.goalId,
                id_activity: userCreate.activityId,
                accept_terms: userCreate.terms)
            
            try await user.create(on: transaction)
            //save user allergies
            guard let userId = user.id else {throw Abort(.internalServerError)}
            userCreate.allergies.forEach { allergy in
                 _ = UserAllergy(id_user: userId, id_allergy: allergy.id).create(on: transaction)
            }
            //save photo in server
            if !userCreate.photo.isEmpty && !userCreate.ext.isEmpty{
                guard let data = Data(base64Encoded: userCreate.photo) else {throw Abort(.internalServerError)}
                try await req.fileio.writeFile(ByteBuffer(bytes: data),at:"Public" + Constants.profileImagePath + photo)
            }
            
            //create diet (temp)
            try await DietHelper.createDiet(userID: userId, goalID: userCreate.goalId, db: transaction)
            
           return userId
        }
        // JWT Tokens
        let tokens = JWTToken.generateTokens(userID: userId)
        let accessSigned = try req.jwt.sign(tokens.access)
        let refreshSigned = try req.jwt.sign(tokens.refresh)

        return JWTToken.Public(accessToken: accessSigned, refreshToken: refreshSigned)
    }
    
}
