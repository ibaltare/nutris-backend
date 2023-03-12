@testable import App
import XCTVapor

final class CatalogueControllerTest: XCTestCase {
    var app: Application!
    var envApiKey: String!
    
    override func setUpWithError() throws {
        app = Application(.testing)
        //defer { app.shutdown() }
        try configure(app)
        // Get API from Environment
        envApiKey = Environment.process.API_KEY
    }
    
    override func tearDownWithError() throws {
        app.shutdown()
        envApiKey = nil
    }
    
    func testAllergy() throws {
        try app.test(.GET, "v1/cat/allergy",beforeRequest: { req in
             req.headers.add(name: "Nts-ApiKey", value: envApiKey)
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            let allergies = try res.content.decode([Allergy].self)
            XCTAssertGreaterThan(allergies.count, 1)
        })
    }
    
    func testGoal() throws {
        try app.test(.GET, "v1/cat/goal",beforeRequest: { req in
             req.headers.add(name: "Nts-ApiKey", value: envApiKey)
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            let data = try res.content.decode([Goal].self)
            XCTAssertGreaterThan(data.count, 1)
        })
    }
    
    func testCountry() throws {
        try app.test(.GET, "v1/cat/country",beforeRequest: { req in
             req.headers.add(name: "Nts-ApiKey", value: envApiKey)
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            let data = try res.content.decode([Country].self)
            XCTAssertGreaterThan(data.count, 1)
        })
    }
    
    func testActivity() throws {
        try app.test(.GET, "v1/cat/activity",beforeRequest: { req in
             req.headers.add(name: "Nts-ApiKey", value: envApiKey)
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            let data = try res.content.decode([Activity].self)
            XCTAssertGreaterThan(data.count, 1)
        })
    }
    
}
