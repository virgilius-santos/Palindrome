//
//  ViewController.swift
//  Palindrome
//
//  Created by Virgilius Santos on 20/10/2018.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let describing = String(describing: ViewController.self)
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.returnKeyType = .done
        }
    }
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var checkImageView: UIImageView!
    
    @IBOutlet weak var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        viewModel.isPalindrome.bind(key: describing) { (isPalidrome) in
            self.checkImageView.isHidden = !isPalidrome
            self.saveButton.isEnabled = isPalidrome
        }
        
        viewModel.newWordAdd.bind(key: describing) { (_) in
            self.textField.text = String()
        }
    }
    
    deinit {
        viewModel.isPalindrome.removeBind(key: describing)
        viewModel.newWordAdd.removeBind(key: describing)
    }

    @IBAction func saveAction(_ sender: Any) {
        viewModel.saveWord(textField.text)
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
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
