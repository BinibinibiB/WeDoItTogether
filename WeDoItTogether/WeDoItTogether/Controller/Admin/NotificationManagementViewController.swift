//
//  NotificationManagementViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/06.
//

import UIKit

class NotificationManagementViewController: UIViewController {
    let notificationManagementView = NotificationManagementView()
    
    override func loadView() {
        super.loadView()
        self.view = notificationManagementView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        configureTableView()
    }
    
    private func configureTableView(){
        notificationManagementView.tableView.register(NotificationContentsTableViewCell.self, forCellReuseIdentifier: NotificationContentsTableViewCell.identifier)
        notificationManagementView.tableView.dataSource = self
        notificationManagementView.tableView.delegate = self
    }
    
    private func setView(){
        self.title = "관리자 페이지 - 공지 관리"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(touchUpAddButton))
        self.navigationItem.rightBarButtonItem = addButton
    }
}

//MARK: - Button
extension NotificationManagementViewController{
    @objc func touchUpAddButton(_ sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(NotificationAddViewController(), animated: true)
    }
}

//MARK: - TableView Delegate
extension NotificationManagementViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationContentsTableViewCell.identifier, for: indexPath) as? NotificationContentsTableViewCell else { fatalError() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
          return UITableView.automaticDimension
    }
}
