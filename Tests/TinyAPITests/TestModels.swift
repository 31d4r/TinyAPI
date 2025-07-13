import Foundation
@testable import TinyAPI

// MARK: - Minimal API Call Implementations

/// Basic GET request test implementation
/// Makes a simple GET call to HTTPBin's get endpoint
struct TestGET: APICall {
    typealias ResponseType = BasicResponse

    var request: APIRequest {
        .get(path: "get")
    }
}

/// Basic POST request test implementation
/// Sends JSON data to HTTPBin's post endpoint
struct TestPOST: APICall {
    typealias ResponseType = BasicResponse

    var request: APIRequest {
        let jsonData = try! JSONSerialization.data(withJSONObject: ["test": "data"])
        return APIRequest(
            method: .post,
            path: "post",
            headers: ["Content-Type": "application/json"],
            body: .json(jsonData)
        )
    }
}

/// Basic file upload test implementation
/// Uploads a simple text file using multipart form data
struct TestUpload: APICall {
    typealias ResponseType = BasicResponse

    var request: APIRequest {
        // Create test file data
        let data = "test".data(using: .utf8)!

        // Create multipart form data
        let parts = [
            MultipartFormData.file(
                name: "file",
                data: data,
                filename: "test.txt",
                mimeType: "text/plain"
            )
        ]

        return .postMultipart(path: "post", parts: parts)
    }
}

/// Minimal response model for basic operations
/// Contains only the essential URL field returned by HTTPBin
struct BasicResponse: Codable {
    let url: String
}
