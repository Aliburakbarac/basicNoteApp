//
//  HomeViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 13.07.2023.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var noteView = UITableView()
    var addButton = ReusableButtonStackView()
    var namesArray = ["Table View Deneme","Table Deneme","Table","Deneme"]

    override func viewDidLoad() {
            super.viewDidLoad()
       
        noteView.delegate = self
        noteView.dataSource = self
        view.addSubview(noteView)
        noteView.register(NoteCell.self, forCellReuseIdentifier: "NoteCell")
        noteView.reloadData()
        setUpViews()
        applyConstraints()
        addClicked()
      
        }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        setupNavigationBar()
    }
    func setupNavigationBar() {
        let navigationBar = navigationController?.navigationBar
       let leftButton = UIButton(type: .custom)
       leftButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
       leftButton.setImage(UIImage(named: "ic_menu"), for: .normal)
       leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
       let leftBarButton = UIBarButtonItem(customView: leftButton)
       navigationItem.leftBarButtonItem = leftBarButton
       
       let rightButton = UIButton(type: .custom)
       rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
       let originalImage = UIImage(named: "profilePhoto")
       let roundedImage = originalImage?.roundedImageWith(size: CGSize(width: 30, height: 30))
       rightButton.setImage((roundedImage), for: .normal)
       rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
       let rightBarButton = UIBarButtonItem(customView: rightButton)
       navigationItem.rightBarButtonItem = rightBarButton
       
           let searchBar = NoteSearchBar()
           

        navigationBar!.addSubview(leftButton)
        navigationBar!.addSubview(rightButton)
        navigationItem.titleView = searchBar

        let navBarHeight = navigationBar!.frame.height
           let buttonSpacing: CGFloat = 20

           let leftButtonX = buttonSpacing
           let leftButtonY = (navBarHeight - leftButton.frame.height) / 2
           leftButton.frame.origin = CGPoint(x: leftButtonX, y: leftButtonY)

        let rightButtonX = navigationBar!.frame.width - buttonSpacing - rightButton.frame.width
           let rightButtonY = (navBarHeight - rightButton.frame.height) / 2
           rightButton.frame.origin = CGPoint(x: rightButtonX, y: rightButtonY)

           let searchBarX = leftButton.frame.maxX + buttonSpacing
           let searchBarY = (navBarHeight - searchBar.frame.height) / 2
           let searchBarWidth = rightButton.frame.minX - buttonSpacing - searchBarX
           searchBar.frame = CGRect(x: searchBarX, y: searchBarY, width: searchBarWidth, height: searchBar.frame.height)
   
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
    private func setUpViews(){
        
        addButton.setButtonTitle("Add Note")
        addButton.iconImageName = "ic_addnote"
        addButton.colorChange()
        view.addSubview(addButton)
        
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
                
                alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                    self.namesArray.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    completion(true)
                }
        
        let deleteIcon = UIImage(named: "ic_trash")?.withTintColor(.white)
        deleteAction.image = deleteIcon
        deleteAction.backgroundColor = .red

        
        
        let editAction = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
                
            self.navigationController?.pushViewController(EditNoteViewController(), animated: true)
                completion(true)
            }
            let editIcon = UIImage(named: "ic_edit")?.withTintColor(.white)
            editAction.image = editIcon
            editAction.backgroundColor = UIColor(red: 255/255, green: 209/255, blue: 100/255, alpha: 1)
            return UISwipeActionsConfiguration(actions: [deleteAction,editAction])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 124
    }
   
   @objc private func leftButtonTapped() {
       let profileVC = ProfileViewController()
       navigationController?.pushViewController(profileVC, animated: true)
   }
   
   @objc private func rightButtonTapped() {
       //NavBar Profile Photo Button
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
