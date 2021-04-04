
import Foundation

public extension WordDataSource {
  static let mock = WordDataSource(
    saveWord: { _ in },
    deleteWord: { _ in },
    numberOfWords: { 17 },
    word: { _ in "dummy" }
  )
}
