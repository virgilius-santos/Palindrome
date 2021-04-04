import XCTest
@testable import WordDataSource

final class WordDataSourceTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(WordDataSource().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
