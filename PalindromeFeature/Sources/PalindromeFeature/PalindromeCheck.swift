
import Foundation

public func checkIfIsPalindrome(word: String) -> Bool {
  let word = word.uppercased()
  if word.isEmpty || word.count == 1 {
    return false
  }
  
  let last = word.count-1
  let mid = word.count/2
  let rx = stride(from: 0, through: mid, by: 1)
  let ry = stride(from: last, through: mid, by: -1)
  
  return zip(rx, ry).contains(where: { (j,k) in word[j] != word[k] }) == false
}
