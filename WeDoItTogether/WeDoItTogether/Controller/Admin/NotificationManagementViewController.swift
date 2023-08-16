//
//  NotificationManagementViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/06.
//

import UIKit
import Firebase

class NotificationManagementViewController: UIViewController {
    let notificationManagementView = NotificationManagementView()
    var notificationData: [SystemNotification] = notificationList
    
    override func loadView() {
        super.loadView()
        self.view = notificationManagementView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        configureTableView()
        getDatabaseInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        notificationManagementView.tableView.reloadData()
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
extension NotificationManagementViewController {
    @objc func touchUpAddButton(_ sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(NotificationAddViewController(), animated: true)
    }
}

//MARK: - 데이터 불러오기
extension NotificationManagementViewController {
    private func getDatabaseInfo() {
        let ref = Database.database().reference()
        let itemsRef = ref.child("SystemNotification")
        
        if notificationList.isEmpty {
            itemsRef.observeSingleEvent(of: .value) { (snapshot)  in
                if let items = snapshot.children.allObjects as? [DataSnapshot] {
                    for itemSnapshot in items {
                        if let notification = itemSnapshot.value as? [String: Any],
                           let id = notification["id"] as? String,
                           let title = notification["title"] as? String,
                           let contents = notification["contents"] as? String,
                           let date = notification["createDate"] as? String
                        {
                            let noti = SystemNotification(id: id ,title: title, contents: contents, createDate: date)
                            notificationList.append(noti)
                        }
                        
                    }
                    self.notificationManagementView.tableView.reloadData()
                }
            }

        }
            
    }
}
//MARK: - TableView Delegate
extension NotificationManagementViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationContentsTableViewCell.identifier, for: indexPath) as? NotificationContentsTableViewCell else { fatalError() }
        
        cell.titleLabel.text = notificationList[indexPath.row].title
        cell.dateLabel.text = notificationList[indexPath.row].createDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
          return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = SystemNotificationDetailViewController()
        detailViewController.notification = notificationList[indexPath.row]
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let ref = Database.database().reference().child("SystemNotification")
        
        if editingStyle == .delete {
            ref.child(notificationList[indexPath.row].id).removeValue()
            notificationList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert { }
    }
}


