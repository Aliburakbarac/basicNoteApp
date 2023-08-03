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
        button.backgroundColor = UIColor(red: 0.863, green: 0.863, blue: 1, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor(red: 0.545, green: 0.549, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        addArrangedSubview(button)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        buttonTappedHandler?()
    }
    
    func setButtonTitle(_ title: String) {
        button.setTitle(title, for: .normal)
    }
    func setButtonColor(){
        button.backgroundColor = UIColor(red: 0.55, green: 0.55, blue: 1, alpha: 1)
        button.setTitleColor(.white, for: .normal)
    }
    
}
