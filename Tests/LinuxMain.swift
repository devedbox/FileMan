import XCTest

import FileManTests

var tests = [XCTestCaseEntry]()
tests += FileManTests.allTests()
XCTMain(tests)