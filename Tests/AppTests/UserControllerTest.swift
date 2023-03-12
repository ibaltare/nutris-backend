@testable import App
import XCTVapor

final class UserControllerTest: XCTestCase {
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

    func testProfile() throws {
        let tempToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Nzg2NTUwNjMuMTg1ODMxMSwic3ViIjoiMSIsInR5cGUiOiJhY2Nlc3MifQ.Kl6K1UlRyOBnhjmAHYi08KxqQQ7KbQthG6OfR019go8"
        
        try app.test(.GET, "/v1/users/profile",beforeRequest: { req in
            req.headers.add(name: "Nts-ApiKey", value: envApiKey)
            req.headers.bearerAuthorization = BearerAuthorization(token: tempToken)
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            let data = try res.content.decode(User.Public.self)
            XCTAssertNotNil(data.fullname)
        })
    }

}
