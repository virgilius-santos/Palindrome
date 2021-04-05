import XCTest
import WordDataSource
@testable import WordDataSourceLive
import RealmSwift
import Realm

final class WordDataSourceTests: XCTestCase {
  
  func test_initial_value() {
    let sut = makeSut()
    
    XCTAssertEqual(sut.numberOfWords(), 0)
  }
  
  func test_add_word() {
    let sut = makeSut()
    
    sut.saveWord("dummy")
    XCTAssertEqual(sut.numberOfWords(), 1)
    XCTAssertEqual(sut.word(0), "dummy")
    
    sut.deleteWord(0)
    XCTAssertEqual(sut.numberOfWords(), 0)
  }
  
  func makeSut(_ function: String = #function) -> WordDataSource {
    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = function
    let sut = WordDataSource.live
    
    return sut
  }
}
