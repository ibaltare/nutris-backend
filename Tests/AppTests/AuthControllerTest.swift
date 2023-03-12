@testable import App
import XCTVapor

final class AuthControllerTest: XCTestCase {
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
    
    func testSignIn() throws {
        try app.test(.POST, "/v1/users/login",beforeRequest: { req in
            req.headers.add(name: "Nts-ApiKey", value: envApiKey)
            req.headers.basicAuthorization = BasicAuthorization(username: "test1@nutri.com", password: "123456")
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            let data = try res.content.decode(JWTToken.Public.self)
            XCTAssertNotNil(data.accessToken)
        })
    }
    
    func testRefresh() throws {
        let tempToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzkwMjMwMDAuMjAwOTQwMSwic3ViIjoiMSIsInR5cGUiOiJyZWZyZXNoIn0.YXaXKUVx8fyeSLLz96zyL2m3hnH7dMKMS1iYFfxkZyw"
        
        try app.test(.GET, "/v1/users/refresh",beforeRequest: { req in
            req.headers.add(name: "Nts-ApiKey", value: envApiKey)
            req.headers.bearerAuthorization = BearerAuthorization(token: tempToken)
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            let data = try res.content.decode(JWTToken.Public.self)
            XCTAssertNotNil(data.accessToken)
        })
    }
    
}
