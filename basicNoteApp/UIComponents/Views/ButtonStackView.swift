//
//  ButtonView.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 31.07.2023.
//

import UIKit

class ReusableButtonStackView: UIStackView {
    private var button: UIButton!
    
    var buttonTappedHandler: (() -> Void)?
    
    var iconImageName: String? {
            didSet {
                if let iconName = iconImageName {
                    let icon = UIImage(named: iconName)
                    button.setImage(icon, for: .normal)
                    
                }
            }
        }
    
    
    
    init() {
        super.init(frame: .zero)
        setupStackView()
        createButton()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        axis = .vertical
        alignment = .fill
        distribution = .fill
        spacing = 10
    }
    
    private func createButton() {
        button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 327, height: 63)
        button.backgroundColor = .appLightPurple
        button.layer.cornerRadius = 5
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.appPurple, for: .normal)
        button.titleLabel?.font = .title2()
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        button.isEnabled = false
        
        addArrangedSubview(button)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        buttonTappedHandler?()
    }
    
    func setButtonTitle(_ title: String) {
        button.setTitle(title, for: .normal)
    }
    
    func isEnabled(){
        button.isEnabled = true
        button.backgroundColor = .appPurple
        button.setTitleColor(.white, for: .normal)
    }
    
}
