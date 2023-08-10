//
//  BaseViewController.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 1.08.2023.
//

import UIKit

class BaseViewController: UIViewController {

    let toastLink = ToastPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardFunction()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = ""
        self.navigationItem.rightBarButtonItem?.isHidden = true
        self.navigationItem.titleView?.isHidden = true
        
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
