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

extension PalindromeViewModel {
  static let mock = PalindromeViewModel(
    isPalindrome: Box<Bool>(true),
    saveWord: { _ in },
    deleteWord: { _, _ in },
    numberOfWords: { 17 },
    wordFor: { _ in "dummy" },
    newWord: { _ in }
  )
}
