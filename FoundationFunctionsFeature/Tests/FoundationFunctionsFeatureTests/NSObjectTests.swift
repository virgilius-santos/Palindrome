import XCTest
import FoundationFunctionsFeature

final class NSObjectTests: XCTestCase {
    func test_identifier() {
      XCTAssertEqual(NSObject.identifier, "NSObject")
      XCTAssertEqual(NSObject().identifier, "NSObject")
    }
}
