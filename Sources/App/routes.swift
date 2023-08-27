import Fluent
import Vapor
import SwiftProtobuf

func routes(_ app: Application) throws {
    app.post("/auth.v1.AuthService/BeginAuth") { req async -> Auth_V1_BeginAuthResponse in
        return .init()
    }
    app.post("/auth.v1.AuthService/NextStep") { req async -> Auth_V1_BeginAuthResponse in
        return .init()
    }
}
