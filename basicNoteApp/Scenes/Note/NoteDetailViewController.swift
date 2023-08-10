//
//  NoteDetailViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 10.08.2023.
//

import UIKit

class NoteDetailViewController: BaseViewController {

    private let NoteView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 0, width: 327, height: 254)
        textView.backgroundColor = .appGray
        textView.font = .title2()
        textView.text = "ASDLŞASFŞSDİFLSDŞFLSDİŞGLŞİSFDLGŞİDFLGİŞDFLGŞİDLFGŞİDFLGİŞDLFGŞİDFGLŞDİFGLŞİDFLGŞİDLFGŞİDFLGİDFŞGLDİŞFGLŞİDFLGDİŞFGLŞDİFGLDŞİFGLİDŞFGLŞİDGLŞİDFGLDİŞFGLDİŞFGLİDFŞGLDFİGŞLİDFGŞLDŞİGF"
        textView.isEditable = false
        return textView
    }()
    private let NoteTitle: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 327, height: 27)
        label.textColor = .appBlack
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Bu ilk not denemesi"
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        applyConstraints()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Note Details"
    }
    
    private func setUpView(){
        view.addSubview(NoteView)
        view.addSubview(NoteTitle)
    }
    
    private func applyConstraints(){
        
        NoteView.translatesAutoresizingMaskIntoConstraints = false
        NoteTitle.translatesAutoresizingMaskIntoConstraints = false
        
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
 
        ])
    }


}
