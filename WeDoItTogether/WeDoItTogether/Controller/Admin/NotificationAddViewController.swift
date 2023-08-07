//
//  NotificationAddViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/07.
//

import UIKit
import Firebase

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
        guard let title = notificationAddView.titleTextField.text else { return }
        guard let contents = notificationAddView.contentsTextView.text else { return }
        
        //Date to String
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        
        let date = formatter.string(from: Date())
        
        let newNotification = SystemNotification(id: UUID().uuidString ,title: title, contents: contents, createDate: date)
        let newItemDictionary = newNotification.asDictionary()
        
        let database = Database.database().reference()
        let newItemRef = database.child("SystemNotification").child(newNotification.id)
        
        newItemRef.setValue(newItemDictionary)
        
        notificationList.append(newNotification)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func touchUpCancelButton(_ sender: UIBarButtonItem){
        print("cancel")
        self.navigationController?.popViewController(animated: true)
    }
    
}
