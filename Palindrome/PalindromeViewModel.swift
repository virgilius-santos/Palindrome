
import Foundation
import PalindromeFeature
import FunctionsFeature

extension PalindromeViewModel {
  static let live: PalindromeViewModel = {
    
    let dataSource = WordSource()
    
    var word: String = String()
    
    let isPalindrome: Box<Bool> = .init(false)
    
    return PalindromeViewModel(
      isPalindrome: isPalindrome,
      saveWord: { completion in
        dataSource.saveWord(word)
        isPalindrome.value = false
        completion()
      },
      deleteWord: { row, completion in
        dataSource.deleteWord(row: row)
        completion()
      },
      numberOfWords: { dataSource.numberOfWords() },
      wordFor: { dataSource.word(row: $0) },
      newWord: { string in
        word = (string ?? "")
        isPalindrome.value = checkIfIsPalindrome(word: word)
      }
    )
  }()
}
