import Fluent
import Vapor
import SwiftProtobuf

func routes(_ app: Application) throws {
    app.post("/auth.v1.AuthService/BeginAuth") { req async throws -> Response in
        let preq: Auth_V1_BeginAuthRequest = try req.decodeMessage()
        _ = preq
        return try Auth_V1_BeginAuthResponse().toResponse(on: req)
    }
    app.post("/auth.v1.AuthService/NextStep") { req async throws -> Response in
        return try Auth_V1_NextStepResponse().toResponse(on: req)
    }
}
