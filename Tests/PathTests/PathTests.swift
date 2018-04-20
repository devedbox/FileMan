import XCTest
@testable import Path

final class PathTests: XCTestCase {
    static var allTests = [
        ("testThisPath", testThisPath),
    ]
    
    func testThisPath() {
        let path: Path = "."
        XCTAssertEqual(path.kind, .this)
    }
    
    func testSuperPath() {
        let path = ".." as Path
        XCTAssertEqual(path.kind, .super)
    }
    
    func testNormalPath() {
        let path = "/User/Current/Docs" as Path
        XCTAssertEqual(path.kind, .path("/User/Current/Docs"))
    }
}
