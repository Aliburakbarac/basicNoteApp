//
//  SearchBar.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 3.08.2023.
//

import UIKit

class NoteSearchBar: UISearchBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
        
    private func commonInit() {
        placeholder = "Search..."
        layer.masksToBounds = true
        searchTextField.backgroundColor = UIColor.clear 
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.cornerRadius = 4
        searchTextField.layer.borderColor = UIColor(red: 226/255, green: 230/255, blue: 234/255, alpha: 1).cgColor
        searchTextField.textColor = UIColor(red: 131/255, green: 141/255, blue: 146/255, alpha: 1)
        searchBarStyle = .prominent

    }
}
