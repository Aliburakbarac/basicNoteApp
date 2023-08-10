//
//  AddNoteViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 7.08.2023.
//

import UIKit

final class AddNoteViewController: BaseViewController {
    
    private let NoteView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 0, width: 375, height: 254)
        textView.backgroundColor = .appLightGray
        textView.font = .title2()
        textView.text = "Note: "
        textView.layer.cornerRadius = 3
        return textView
    }()
    private let NoteTitle: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: 327, height: 27)
        textField.textColor = .appBlack
        textField.backgroundColor = .appLightGray
        textField.placeholder = "Note Title:"
        textField.font = .title22()
        textField.layer.cornerRadius = 3
        return textField
    }()
    private let addButton: ReusableButtonStackView = {
       let button = ReusableButtonStackView()
        button.setButtonTitle("Add Note")
        button.isEnabled()
        button.iconImageName = "ic_addnote"
        return button
    }()
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Add Note"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        applyConstraints()
        // Do any additional setup after loading the view.
    }
   
    
    private func setUpView(){
        view.addSubview(NoteView)
        view.addSubview(NoteTitle)
        view.addSubview(addButton)
    }
    
    private func applyConstraints(){
        
        NoteView.translatesAutoresizingMaskIntoConstraints = false
        NoteTitle.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            
            NoteTitle.widthAnchor.constraint(equalToConstant: 327),
            NoteTitle.heightAnchor.constraint(equalToConstant: 27),
            NoteTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 135),
            NoteTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            NoteTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            
            NoteView.widthAnchor.constraint(equalToConstant: 327),
            NoteView.heightAnchor.constraint(equalToConstant: 171),
            NoteView.topAnchor.constraint(equalTo: NoteTitle.bottomAnchor, constant: 8),
            NoteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            NoteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            addButton.widthAnchor.constraint(equalToConstant: 142),
            addButton.heightAnchor.constraint(equalToConstant: 41),
            addButton.topAnchor.constraint(equalTo: NoteView.bottomAnchor, constant: 25),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 117),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -116)
            
        
        ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
