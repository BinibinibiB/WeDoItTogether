//
//  NotificationAddViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/07.
//

import UIKit

class NotificationAddViewController: UIViewController {
    let notificationAddView = NotificationAddView()
    
    override func loadView() {
        super.loadView()
        self.view = notificationAddView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
    }
    
    func setNavigation() {
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(touchUpSaveButton))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(touchUpCancelButton))
        
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = saveButton
    }

}

//MARK: - Button
extension NotificationAddViewController {
    @objc func touchUpSaveButton(_ sender: UIBarButtonItem){
        print("save")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func touchUpCancelButton(_ sender: UIBarButtonItem){
        print("cancel")
        self.navigationController?.popViewController(animated: true)
    }
}
