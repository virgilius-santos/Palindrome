//
//  Validation.swift
//  Palindrome
//
//  Created by Virgilius Santos on 20/10/2018.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation

extension String {
    var isPalindrome: Bool {
        return Validation.checkIfIsPalindrome(word: self)
    }
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

class Validation {
    class func checkIfIsPalindrome(word: String) -> Bool {
        if word.isEmpty || word.count == 1 {
            return false
        }
        
        let last = word.count-1
        let mid = word.count/2
        let rx = stride(from: 0, through: mid, by: 1)
        let ry = stride(from: last, through: mid, by: -1)
        for (j,k) in zip(rx, ry) {
            if word[j] != word[k] {
                return false
            }
        }
        
        return true
    }
}
