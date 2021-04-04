import XCTest
import FoundationFuncionsFeature

final class FoundationFuncionsFeatureTests: XCTestCase {
    func test_identifier() {
      XCTAssertEqual(NSObject.identifier, "NSObject")
      XCTAssertEqual(NSObject().identifier, "NSObject")
    }
}
