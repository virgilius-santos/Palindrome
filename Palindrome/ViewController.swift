//
//  ViewController.swift
//  Palindrome
//
//  Created by Virgilius Santos on 20/10/2018.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.returnKeyType = .done
        }
    }
    
    @IBOutlet weak var checkImageView: UIImageView!
    
    @IBOutlet weak var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        viewModel.isPalindrome.bind(key: String(describing: ViewController.self)) { (isPalidrome) in
            self.checkImageView.isHidden = !isPalidrome
        }
    }
    
    deinit {
        viewModel.isPalindrome.removeBind(key: String(describing: ViewController.self))
    }

}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string == "\n") {
            textField.resignFirstResponder()
        }
        
        viewModel.newWord(textField.text ?? "" + string)
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel.saveWord(textField.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewModel.saveWord(textField.text)
        textField.resignFirstResponder()
        return true
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =     UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
