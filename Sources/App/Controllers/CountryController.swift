import Vapor

struct CountryController: RouteCollection {
    
    // MARK: - Override
    func boot(routes: RoutesBuilder) throws {
        routes.get("country", use: allCountries)
    }
    
    func allCountries(req: Request) async throws -> [Country] {
        try await Country.query(on: req.db).sort(\.$country).all()
    }
    
}
