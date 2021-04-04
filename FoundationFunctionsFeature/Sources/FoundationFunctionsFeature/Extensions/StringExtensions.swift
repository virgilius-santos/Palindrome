
import Foundation

public extension String {
  subscript (i: Int) -> Character {
    self[index(startIndex, offsetBy: i)]
  }
}
