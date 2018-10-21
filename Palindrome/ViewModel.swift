//
//  ViewModel.swift
//  Palindrome
//
//  Created by Virgilius Santos on 20/10/2018.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation

protocol ViewModelProtocol {
    var isPalindrome: Box<Bool> {get}
    func saveWord(completion: @escaping()->())
    func deleteWord(row: Int, completion: @escaping()->())
    func numberOfWords() -> Int
    func word(row: Int) -> String
    func newWord(_ string: String?)
}

class ViewModel: NSObject , ViewModelProtocol {
    
    var dataSource: WordSourceProtocol!
    
    lazy var isPalindrome: Box<Bool> = Box(false)
    
    lazy var word: String = String()
    
    func newWord(_ string: String?) {
        word = (string ?? "")
        isPalindrome.value = word.isPalindrome
    }
    
    func saveWord(completion: @escaping()->()) {
        dataSource.saveWord(word)
        isPalindrome.value = false
        completion()
    }
    
    func word(row: Int) -> String {
        return dataSource.word(row: row)
    }
    
    func numberOfWords() -> Int {
        return dataSource.numberOfWords()
    }
    
    func deleteWord(row: Int, completion: @escaping()->()) {
        dataSource.deleteWord(row: row)
        completion()
    }
}
