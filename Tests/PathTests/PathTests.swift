import XCTest
@testable import Path

final class PathTests: XCTestCase {
    static var allTests = [
        ("testThisPath", testThisPath),
    ]
    
    func testThisPath() {
        let path: Path = "."
        XCTAssertEqual(path.kind, Path.Kind.this)
    }
}
