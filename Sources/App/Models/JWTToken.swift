import Vapor
import JWT

enum JWTTokenType: String, Codable {
    case access
    case refresh
}

struct JWTToken: Content, JWTPayload, Authenticatable {
    
    // MARK: - Properties
    var exp: ExpirationClaim
    var sub: SubjectClaim
    var type: JWTTokenType
    
    // MARK: - JWTPayload
    func verify(using signer: JWTSigner) throws {
        
        // Expired
        try exp.verifyNotExpired()
        
        // Validate subject
        guard let _ = Int(sub.value) else {
            throw JWTError.claimVerificationFailure(name: "sub", reason: "Subject is invalid")
        }
        
        // Validate JWT type
        guard type == .access || type == .refresh else {
            throw JWTError.claimVerificationFailure(name: "type", reason: "JWT type is invalid")
        }
        
    }
    
}

// MARK: - DDTOs
extension JWTToken {
    
    struct Public: Content {
        
        let accessToken: String
        let refreshToken: String
        
    }
    
}

// MARK: - Auxiliar
extension JWTToken {
    
    static func generateTokens(userID: Int) -> (access: JWTToken, refresh: JWTToken) {
        
        var expDate = Date().addingTimeInterval(Constants.accessTokenLifetime)
        let access = JWTToken(exp: .init(value: expDate), sub: .init(value: String(userID)), type: .access)
        
        expDate = Date().addingTimeInterval(Constants.refreshTokenLifeTime)
        let refresh = JWTToken(exp: .init(value: expDate), sub: .init(value: String(userID)), type: .refresh)
        
        return (access, refresh)
        
    }
    
}
