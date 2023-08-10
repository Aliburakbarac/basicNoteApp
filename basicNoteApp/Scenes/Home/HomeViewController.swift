//
//  HomeViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 13.07.2023.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var noteView = UITableView()
    var addButton: ReusableButtonStackView = {
       let button = ReusableButtonStackView()
        button.setButtonTitle("Add Note")
        button.iconImageName = "ic_addnote"
        button.isEnabled()
        return button
    }()
    var namesArray = ["Table View Deneme","Table Deneme","Table","Deneme"]

    override func viewDidLoad() {
            super.viewDidLoad()
       
        noteView.delegate = self
        noteView.dataSource = self
        view.addSubview(noteView)
        view.addSubview(addButton)
        noteView.register(NoteCell.self, forCellReuseIdentifier: "NoteCell")
        noteView.reloadData()
        applyConstraints()
        addClicked()
        }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        setupStyle2NavigationBar()
        
    }
    
    private func applyConstraints(){
        noteView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            noteView.widthAnchor.constraint(equalToConstant: 375),
            noteView.heightAnchor.constraint(equalToConstant: 496),
            noteView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            noteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            noteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        
            addButton.widthAnchor.constraint(equalToConstant: 142),
            addButton.heightAnchor.constraint(equalToConstant: 41),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 116.5),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -116.5)
        
        
        
        ])
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteCell

        cell.titleLabel.text = namesArray[indexPath.row]
        cell.descriptionLabel.text = namesArray[indexPath.row]
        //let note = notes[indexPath.row]
        //cell.titleLabel.text = note.title
        //cell.sub.text = note.sub

        return cell
        
    }
    private func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "") { (action, view, completion) in
                let alert = UIAlertController(title: "Delete Note", message: "Are you sure you want to delete this note?", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                    self.namesArray.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }))
                    
                    self.present(alert, animated: true, completion: nil)
                    completion(true)
                }
        
        let deleteIcon = UIImage(named: "ic_trash")
        deleteAction.image = deleteIcon
        deleteAction.backgroundColor = .appRed

        
        
        let editAction = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
                
            self.navigationController?.pushViewController(EditNoteViewController(), animated: true)
                completion(true)
            }
            let editIcon = UIImage(named: "ic_edit")
            editAction.image = editIcon
        editAction.backgroundColor = .appYellow
            return UISwipeActionsConfiguration(actions: [deleteAction,editAction])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 124
    }
    
    private func addClicked(){
        addButton.buttonTappedHandler = {
            let AddVC = AddNoteViewController()
            self.navigationController?.pushViewController(AddVC, animated: true)
        }
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
