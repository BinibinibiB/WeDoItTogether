//
//  SystemNotificationDetailViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/07.
//

import UIKit

class SystemNotificationDetailViewController: UIViewController {
    
    let systemNotificationDetailView = SystemNotificationDetailView()
    var notification: SystemNotification?
    var user = UserDefaultsData.shared.getUser()
    
    override func loadView() {
        super.loadView()
        self.view = systemNotificationDetailView
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        setBarButton()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setLabel()
    }
    private func setLabel(){
        guard let titleLabel = notification?.title else { return }
        guard let contentsLabel = notification?.contents else { return }
        
        systemNotificationDetailView.titleLabel.text = titleLabel
        systemNotificationDetailView.contentsLabel.text = contentsLabel
    }
    
    private func setBarButton(){
        //관리자만 나타나도록
        if user?.email == "admin@admin.com" {
            let editButton = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(touchUpEditButton))
            self.navigationItem.rightBarButtonItem = editButton
        }
    }
}

//MARK: - Button
extension SystemNotificationDetailViewController{
    @objc func touchUpEditButton(_ sender: UIBarButtonItem){
        let editViewController = SystemNotificationEditViewController()
        editViewController.notification = notification
        editViewController.delegate = self
        self.navigationController?.pushViewController(editViewController, animated: true)
    }
}

//MARK: - 데이터 전달 Delegate
extension SystemNotificationDetailViewController: ChangeNotificaionDelegate {
    func changeData(data: SystemNotification) {
        self.notification = data
    }
}
