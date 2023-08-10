//
//  ToastWarningView.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 7.08.2023.
//

import UIKit

class ToastWarningView: UIView {

    private let label = UILabel()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(text: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        

        configureLabel(text: text)
        configureContents()
    }

    private func configureLabel(text: String) {
        label.text = text
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
    }

    private func configureContents() {
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }
}
