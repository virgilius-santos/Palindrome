import XCTest
import PalindromeFeature
import FunctionsFeature
import BoxFeature

final class PalindromeFeatureTests: XCTestCase {
  var viewController: UIViewController? = PalindromeViewController(viewModel: .mock)
  
  func testExample() {
    _ = viewController?.view
    viewController = nil
    addTeardownBlock { [weak viewController] in
      XCTAssertNil(viewController)
    }
  }
}
