//
//  SystemNotificationEditViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/10.
//

import UIKit
import Firebase

//pop되는 detail 뷰로 변경 데이터 전달 델리게이트
protocol ChangeNotificaionDelegate {
  func changeData(data: SystemNotification)
}

class SystemNotificationEditViewController: UIViewController {
    let editView = NotificationAddView()
    var notification:SystemNotification?
    var delegate: ChangeNotificaionDelegate?
    
    override func loadView() {
        super.loadView()
        view = editView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
        setBarButton()
        // Do any additional setup after loading the view.
    }
    
    func setText(){
        guard let titleText = notification?.title else { return }
        guard let contentsText = notification?.contents else { return }
        
        editView.titleTextField.text = titleText
        editView.contentsTextView.text = contentsText
    }
    
    func setBarButton(){
        let saveButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(touchUpSaveButton))
        self.navigationItem.rightBarButtonItem = saveButton
    }
}

//MARK: - Button
extension SystemNotificationEditViewController {
    @objc func touchUpSaveButton(_ sender: UIBarButtonItem) {
        self.showAlert(message: "수정 사항을 저장하시겠습니까?", title: "저장", isCancelButton: true) {
            //데이터베이스 수정
            guard let newTitle = self.editView.titleTextField.text else { return }
            guard let newContents = self.editView.contentsTextView.text else { return }
            guard let notificationId = self.notification?.id else { return }
            let ref = Database.database().reference()
            ref.child("SystemNotification").child(notificationId).updateChildValues(["title" : newTitle])
            ref.child("SystemNotification").child(notificationId).updateChildValues(["contents" : newContents])
            
            
            //notificationList 수정
            self.changeNotification(newTitle: newTitle, newContents: newContents )
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func changeNotification(newTitle: String, newContents: String){
        if let index = notificationList.firstIndex(where: { noti in
            noti.id == notification?.id
        }){
            guard let id = notification?.id else { return }
            guard let date = notification?.createDate else { return }
            let newNotification = SystemNotification(id: id, title: newTitle, contents: newContents, createDate: date)
            notificationList[index] = newNotification
            delegate?.changeData(data: newNotification)
        }
    }
}
