//: A UIKit based Playground for presenting user interface
  
import PalindromeFeature
import UIKit
import PlaygroundSupport


// Present the view controller in the Live View window
let vc = PalindromeViewController()
vc.baseView.saveButton.setTitle("saveButton", for: .normal)
vc.baseView.titleLabel.text = "titleLabel"
vc.baseView.subtitleLabel.text = "subtitleLabel"
vc.baseView.textField.text = "textField"

vc.view.frame = .init(origin: .zero, size: .init(width: 300, height: 600))
PlaygroundPage.current.liveView = vc
