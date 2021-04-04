
import Foundation
import FunctionsFeature
import BoxFeature

public struct PalindromeViewModel {
  public var isPalindrome: Box<Bool>
  public var saveWord: (() -> Void) -> Void
  public var deleteWord: (_ row: Int, _ completion: () -> Void) -> Void
  public var numberOfWords: () -> Int
  public var wordFor: (_ row: Int) -> String
  public var newWord: (_ string: String?) -> Void
  
  public init(
    isPalindrome: Box<Bool>,
    saveWord: @escaping (() -> Void) -> Void,
    deleteWord: @escaping (Int, () -> Void) -> Void,
    numberOfWords: @escaping () -> Int,
    wordFor: @escaping (Int) -> String,
    newWord: @escaping (String?) -> Void
  ) {
    self.isPalindrome = isPalindrome
    self.saveWord = saveWord
    self.deleteWord = deleteWord
    self.numberOfWords = numberOfWords
    self.wordFor = wordFor
    self.newWord = newWord
  }
}
