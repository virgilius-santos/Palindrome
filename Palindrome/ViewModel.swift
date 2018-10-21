//
//  ViewModel.swift
//  Palindrome
//
//  Created by Virgilius Santos on 20/10/2018.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    
    var isPalindrome: Box<Bool> = Box(false)
    
    var newWordAdd: Box<String> = Box(String())
    
    func newWord(_ string: String?) {
        isPalindrome.value = (string ?? "").isPalindrome
    }
    
    func saveWord(_ string: String?) {
        newWordAdd.value.removeAll()
        isPalindrome.value = false
    }
}
