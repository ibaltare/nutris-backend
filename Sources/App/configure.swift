import Fluent
import FluentPostgresDriver
import Vapor
import JWT

// configures your application
public func configure(_ app: Application) throws {
    guard let jwtKey = Environment.process.JWT_KEY else { fatalError("JWT_KEY not found") }
    guard let dbURL = Environment.process.DATABASE_URL else { fatalError("DATABASE_URL not found") }
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    // Config passwords hashes
    app.passwords.use(.bcrypt)
    // Configure JWT
    app.jwt.signers.use(.hs256(key: jwtKey))
    // DB connection
    try app.databases.use(.postgres(url: dbURL), as: .psql)
    // register routes
    try routes(app)
}
