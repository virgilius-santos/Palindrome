//
//  ViewModel.swift
//  Palindrome
//
//  Created by Virgilius Santos on 20/10/2018.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation

@objc protocol ViewModelDelegate {
    func addWord()
}

class ViewModel: NSObject {
    
    var isPalindrome: Box<Bool> = Box(false)
    
    var word: String = String()
    
    @IBOutlet weak var delegate: ViewModelDelegate?
    
    func newWord(_ string: String?) {
        word = (string ?? "")
        isPalindrome.value = word.isPalindrome
    }
    
    func saveWord() {
        tteste.append(word)
        isPalindrome.value = false
        delegate?.addWord()
    }
    
    func word(row: Int) -> String {
        return tteste[row]
    }
    
    func numberOfWords() -> Int {
        return tteste.count
    }
    
    func deleteWord(row: Int, completion: @escaping()->()) {
        tteste.remove(at: row)
        completion()
    }
}

var tteste: [String] = [String](repeating: "teste", count: 10)
