@testable import App
import XCTVapor

final class RegisterControllerTest: XCTestCase {
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

    func testUserRegister() throws {
        try app.test(.POST, "/v1/users/register",beforeRequest: { req in
            req.headers.add(name: "Nts-ApiKey", value: envApiKey)
            try req.content.encode(getUserData())
        }, afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            let data = try res.content.decode(JWTToken.Public.self)
            XCTAssertNotNil(data.accessToken)
        })
    }
    
    func getUserData() -> User.Create {
        User.Create(fullname: "User Test", email: "test1@temp.net", password: "123456", age: 30, gender: "Man", weight: 70, height: 168, photo: "", ext: "", countryId: 1, goalId: 1, activityId: 1, terms: true, allergies: [])
    }

}
