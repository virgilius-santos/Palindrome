
import Foundation

public extension String {
  subscript (i: Int) -> Character {
    self[index(startIndex, offsetBy: i)]
  }
}

public func onlyAlphanumerics(_ string: String) -> String {
  string.components(separatedBy: CharacterSet.alphanumerics.inverted).joined(separator: "")
}