import XCTest
import WordDataSource
@testable import WordDataSourceLive
import RealmSwift
import Realm

final class WordDataSourceTests: XCTestCase {
  
  override func setUp() {
    Current.realm = try! Realm(configuration: .init())
  }
  
  override func tearDown() {
    try! Current.realm.write {
      Current.realm.deleteAll()
    }
  }
  
  func test_initial_value() {
    XCTAssertEqual(WordDataSource.live.numberOfWords(), 0)
  }
  
  func test_add_word() {
    WordDataSource.live.saveWord("dummy")
    XCTAssertEqual(WordDataSource.live.numberOfWords(), 1)
    XCTAssertEqual(WordDataSource.live.word(0), "dummy")
    
    WordDataSource.live.deleteWord(0)
    XCTAssertEqual(WordDataSource.live.numberOfWords(), 0)
  }
}
