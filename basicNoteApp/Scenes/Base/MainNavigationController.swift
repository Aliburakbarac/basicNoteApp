//
//  MainNavigationController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 3.08.2023.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    
    private func setupNavigationBar() {
        let backButtonImage = UIImage(named: "Path")
        navigationBar.tintColor = .appBlack
        navigationBar.backIndicatorImage = backButtonImage
        navigationBar.backIndicatorTransitionMaskImage = backButtonImage
    }
    
}


