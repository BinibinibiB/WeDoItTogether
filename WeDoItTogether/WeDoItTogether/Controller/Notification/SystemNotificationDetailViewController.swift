//
//  SystemNotificationDetailViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/07.
//

import UIKit

class SystemNotificationDetailViewController: UIViewController {
    
    let systemNotificationDetailView = SystemNotificationDetailView()
    var titleLabel: String = ""
    var contentsLabel: String = ""
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
    
    private func setLabel(){
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
        print("수정")
    }
}
