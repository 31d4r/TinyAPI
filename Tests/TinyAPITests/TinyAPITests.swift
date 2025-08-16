@testable import TinyAPI
import XCTest

/// Minimal test suite for basic API operations
/// Uses HTTPBin service to test core HTTP functionality
class TinyAPITests: XCTestCase {
    /// Test basic GET request functionality
    /// Verifies that the API client can perform simple GET operations
    func testGET() async {
        // Initialize API client with HTTPBin service
        let config = DefaultAPIConfiguration(baseURL: URL(string: "https://httpbin.org/")!)
        let client = APIClient(configuration: config)
        
        // Create and execute GET request
        let call = TestGET()
        let result = await client.execute(call)
        
        // Verify successful response
        switch result {
        case .success:
            print("GET request completed successfully")
        case .failure:
            XCTFail("GET request failed")
        }
    }
    
    /// Test basic POST request with JSON payload
    /// Verifies JSON serialization and POST functionality
    func testPOST() async {
        // Initialize API client
        let config = DefaultAPIConfiguration(baseURL: URL(string: "https://httpbin.org/")!)
        let client = APIClient(configuration: config)
        
        // Create and execute POST request
        let call = TestPOST()
        let result = await client.execute(call)
        
        // Verify successful response
        switch result {
        case .success:
            print("POST request completed successfully")
        case .failure:
            XCTFail("POST request failed")
        }
    }
    
    /// Test file upload using multipart form data
    /// Verifies multipart encoding and file upload functionality
    func testUpload() async {
        // Initialize API client
        let config = DefaultAPIConfiguration(baseURL: URL(string: "https://httpbin.org/")!)
        let client = APIClient(configuration: config)
        
        // Create and execute upload request
        let call = TestUpload()
        let result = await client.execute(call)
        
        // Verify successful upload
        switch result {
        case .success:
            print("File upload completed successfully")
        case .failure:
            XCTFail("File upload failed")
        }
    }
}
