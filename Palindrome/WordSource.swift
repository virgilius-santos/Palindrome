//
//  WordSource.swift
//  Palindrome
//
//  Created by Virgilius Santos on 21/10/2018.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation
import RealmSwift

class WordSource {
    
    lazy var realm = try! Realm()
    lazy var words = realm.objects(Word.self).sorted(byKeyPath: "string")
    
    static var shared = WordSource()
    private init() {}
    
    func saveWord(_ string: String) {
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


