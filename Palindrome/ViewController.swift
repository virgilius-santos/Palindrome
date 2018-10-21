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
    
    @IBOutlet weak var tableView: UITableView!
    
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

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfWords()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.word(forRow: indexPath.row)
        return cell
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string == "\n") {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text
        viewModel.newWord(text)
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
