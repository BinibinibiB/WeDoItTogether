//
//  AddContentViewController.swift
//  WeDoItTogether
//
//  Created by 오영석 on 2023/08/07.
//

import UIKit
import Firebase
import UserNotifications


protocol AddContentDelegate: AnyObject {
    func didSaveItem(_ item: Item)
}

class AddContentViewController: UIViewController {
    
    weak var delegate: AddContentDelegate?
    
    var user = UserDefaultsData.shared.getUser()
    let addContentView = AddContentView()
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func loadView() {
        self.view = addContentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        addContentView.searchLocationButton.addTarget(self, action: #selector(searchLocationButton), for: .touchUpInside)
    }
    
    
    func setNavigation() {
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonTapped))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
}

extension AddContentViewController {
    
    @objc func searchLocationButton(_ sender: UIButton) {
        let addContentMapViewController = AddContentMapViewController()
        addContentMapViewController.annotationSelectedCallback = { [weak self] locationResult in
            self?.addContentView.searchLocationButton.setTitle("장소 재설정", for: .normal)
            self?.addContentView.locationResultLabel.text = "약속장소 : \(locationResult)"
        }
        self.navigationController?.pushViewController(addContentMapViewController, animated: true)
    }
    
    @objc func saveButtonTapped(_ sender: UIButton) {
        let titleText = addContentView.titleTextField.text ?? ""
        let memoText = addContentView.memoTextField.text ?? ""
        let dateString = addContentView.dateResultLabel.text ?? ""
        let location = addContentView.locationResultLabel.text ?? ""
        
        guard let user = user else {
            return
        }
        
        let newItem = Item(title: titleText, date: dateString, location: location, memo: memoText, members: [user.name], emails: [user.email], creator: user.email)
        let newItemDictionary = newItem.asDictionary()
        
        let database = Database.database().reference()
        let newItemRef = database.child("items").child("\(newItem.id)")
        
        newItemRef.setValue(newItemDictionary)
        
        delegate?.didSaveItem(newItem)
        
        //알림 추가
        self.userNotificationCenter.addNotificationRequest(item: newItem)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func cancelButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
