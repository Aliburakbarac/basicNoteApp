//
//  ViewController+Extensions.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 10.08.2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setupStyle2NavigationBar() {
        let leftButton = UIButton(type: .custom)
            leftButton.setImage(UIImage(named: "ic_menu"), for: .normal)
            leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
            let leftBarButton = UIBarButtonItem(customView: leftButton)
            navigationItem.leftBarButtonItem = leftBarButton
            
            let rightButton = UIButton(type: .custom)
            let originalImage = UIImage(named: "profilePhoto")
            let roundedImage = originalImage?.roundedImageWith(size: CGSize(width: 30, height: 30))
            rightButton.setImage((roundedImage), for: .normal)
            rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
            let rightBarButton = UIBarButtonItem(customView: rightButton)
            navigationItem.rightBarButtonItem = rightBarButton
            
            let searchBar = NoteSearchBar()
            navigationItem.titleView = searchBar
        leftButton.isHidden = false
        rightButton.isHidden = false
        searchBar.isHidden = false
    }
    @objc private func leftButtonTapped() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc private func rightButtonTapped() {
        //NavBar Profile Photo Button
    }
}
    
    

