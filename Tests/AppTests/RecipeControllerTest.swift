@testable import App
import XCTVapor

final class RecipeControllerTest: XCTestCase {
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

    func testDiet() throws {
        let tempToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Nzg2NTgzNjguOTcwOTE5MSwic3ViIjoiMSIsInR5cGUiOiJhY2Nlc3MifQ.5zcmXGZ9DqQvx-nwlX0R-LyRaN1d0ntZLNfKwmXRdIM"
        
        try app.test(.GET, "/v1/diet",beforeRequest: { req in
            req.headers.add(name: "Nts-ApiKey", value: envApiKey)
            req.headers.bearerAuthorization = BearerAuthorization(token: tempToken)
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            let data = try res.content.decode([Recipe.List].self)
            XCTAssertEqual(data.count, 5)
        })
    }
    
    func testRecipeDetail() throws {
        let tempToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Nzg2NTgzNjguOTcwOTE5MSwic3ViIjoiMSIsInR5cGUiOiJhY2Nlc3MifQ.5zcmXGZ9DqQvx-nwlX0R-LyRaN1d0ntZLNfKwmXRdIM"
        
        try app.test(.GET, "/v1/recipe/2",beforeRequest: { req in
            req.headers.add(name: "Nts-ApiKey", value: envApiKey)
            req.headers.bearerAuthorization = BearerAuthorization(token: tempToken)
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            let data = try res.content.decode(Recipe.Detail.self)
            XCTAssertNotNil(data.title)
        })
    }

}
