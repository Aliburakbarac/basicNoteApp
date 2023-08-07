//
//  EditNoteViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 7.08.2023.
//

import UIKit

final class EditNoteViewController: BaseViewController {
    
    private let NoteView = UITextView()
    private let NoteTitle = UILabel()
    private let addButton = ReusableButtonStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        applyConstraints()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Edit Note"
    }
    
    private func setUpView(){
        
        NoteView.frame = CGRect(x: 0, y: 0, width: 327, height: 254)
        NoteView.textColor = UIColor(red: 0.545, green: 0.584, blue: 0.604, alpha: 1)
        NoteView.font = UIFont.systemFont(ofSize: 16)
        NoteView.text = "ASDLŞASFŞSDİFLSDŞFLSDİŞGLŞİSFDLGŞİDFLGİŞDFLGŞİDLFGŞİDFLGİŞDLFGŞİDFGLŞDİFGLŞİDFLGŞİDLFGŞİDFLGİDFŞGLDİŞFGLŞİDFLGDİŞFGLŞDİFGLDŞİFGLİDŞFGLŞİDGLŞİDFGLDİŞFGLDİŞFGLİDFŞGLDFİGŞLİDFGŞLDŞİGF"
        
        NoteTitle.frame = CGRect(x: 0, y: 0, width: 327, height: 27)
        NoteTitle.textColor = UIColor(red: 0.137, green: 0.137, blue: 0.235, alpha: 1)
        NoteTitle.font = UIFont.boldSystemFont(ofSize: 22)
        NoteTitle.text = "Bu ilk not denemesi"
        
        addButton.setButtonTitle("Save Note")
        addButton.colorChange()
        
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
