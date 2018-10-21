//
//  Assembly.swift
//  Palindrome
//
//  Created by Virgilius Santos on 21/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        setupViewController()
        setupViewModel()
        setupWordSource()
    }
    
    private class func setupViewController() {
        defaultContainer.storyboardInitCompleted(ViewController.self) { r, c in
            c.viewModel = r.resolve(ViewModelProtocol.self)
        }
    }
    
    private class func setupViewModel() {
        defaultContainer.register(ViewModelProtocol.self) { r in
            let vm = ViewModel()
            vm.dataSource = r.resolve(WordSourceProtocol.self)
            return vm
        }
    }
    
    private class func setupWordSource() {
        defaultContainer.register(WordSourceProtocol.self) { _ in WordSource() }
            .inObjectScope(.container)
    }
}
