import Vapor
import SwiftProtobuf
import NIOFoundationCompat

extension ByteBuffer {
    public func allData() -> Data {
        return getData(at: 0, length: readableBytes) ?? Data()
    }
}

extension Request {
    public func decodeMessage<M: SwiftProtobuf.Message>(_ type: M.Type = M.self) throws -> M {
        let data = self.body.data?.allData() ?? Data()

        return try M(jsonUTF8Data: data)
    }
}

extension SwiftProtobuf.Message {
    fileprivate func toHTTPResponse() throws -> Response {
        let http = Response(status: .ok)
        http.headers.contentType = .init(type: "application", subType: "json")
        http.body = .init(data: try serializedData())
        return http
    }
    public func toResponse(on req: Request) throws -> Response {
        return try toHTTPResponse()
    }
}
