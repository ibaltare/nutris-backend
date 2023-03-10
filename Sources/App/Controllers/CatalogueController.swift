import Vapor

struct CatalogueController: RouteCollection {
    
    // MARK: - Override
    func boot(routes: RoutesBuilder) throws {
        routes.get("country", use: allCountries)
        routes.get("goal", use: allGoals)
        routes.get("allergy", use: allAllergies)
        routes.get("activity", use: allPhysicalActivity)
    }
    
    func allCountries(req: Request) async throws -> [Country] {
        try await Country.query(on: req.db).sort(\.$country).all()
    }
    
    func allGoals(req: Request) async throws -> [Goal] {
        try await Goal.query(on: req.db).sort(\.$goal).all()
    }
    
    func allAllergies(req: Request) async throws -> [Allergy] {
        try await Allergy.query(on: req.db).sort(\.$allergy).all()
    }
    
    func allPhysicalActivity(req: Request) async throws -> [Activity] {
        try await Activity.query(on: req.db).sort(\.$activity).all()
    }
    
}
