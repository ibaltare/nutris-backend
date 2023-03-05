import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    
    guard let dbURL = Environment.process.DATABASE_URL else { fatalError("DATABASE_URL not found") }
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    // Config passwords hashes
    app.passwords.use(.bcrypt)
    
    //app.routes.defaultMaxBodySize = "10mb"
    // DB connection
    try app.databases.use(.postgres(url: dbURL), as: .psql)
    // register routes
    try routes(app)
}
