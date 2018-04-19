import XCTest
@testable import FileMan

final class FileManTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FileMan().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
