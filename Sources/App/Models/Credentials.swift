import Vapor

struct Credentials: Content {
    
    let refreshToken: String
    let accessToken: String
}
