//
//  WordSource.swift
//  Palindrome
//
//  Created by Virgilius Santos on 21/10/2018.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation
import RealmSwift

protocol WordSourceProtocol {
    func saveWord(_ string: String)
    func deleteWord(row: Int)
    func numberOfWords() -> Int
    func word(row: Int) -> String
}

class WordSource: WordSourceProtocol {
    
    lazy var realm = try! Realm()
    lazy var words = realm.objects(Word.self).sorted(byKeyPath: "string")
    
    init() {}
    
    func saveWord(_ string: String) {
        
        if words.contains(where: {$0.string.elementsEqual(string)}) {
            return
        }
        
        let word = Word()
        word.string = string
        
        try! realm.write {
            realm.add(word)
        }
    }
    
    func word(row: Int) -> String {
        return words[row].string
    }
    
    func numberOfWords() -> Int {
        return words.count
    }
    
    func deleteWord(row: Int) {
        let word = words[row]
        try! realm.write {
            realm.delete(word)
        }
    }
}


