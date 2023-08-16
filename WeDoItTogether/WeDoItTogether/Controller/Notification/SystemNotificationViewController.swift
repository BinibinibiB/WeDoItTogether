//
//  SystemNotificationViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/19.
//

import UIKit
import Firebase

class SystemNotificationViewController: UIViewController {

    let tableview = UITableView()
    
    override func loadView() {
        self.view = tableview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getDatabaseInfo()
        // Do any additional setup after loading the view.
    }
    private func configureTableView(){
        tableview.register(NotificationContentsTableViewCell.self, forCellReuseIdentifier: NotificationContentsTableViewCell.identifier)
        tableview.dataSource = self
        tableview.delegate = self
    }
}

extension SystemNotificationViewController {
    //MARK: - 데이터 불러오기
    private func getDatabaseInfo() {
        let ref = Database.database().reference()
        let itemsRef = ref.child("SystemNotification")
        
        if notificationList.isEmpty {
            itemsRef.observeSingleEvent(of: .value) { (snapshot) in
                if let items = snapshot.children.allObjects as? [DataSnapshot] {
                    for itemSnapshot in items {
                        if let notification = itemSnapshot.value as? [String: Any],
                           let id = notification["id"] as? String,
                           let title = notification["title"] as? String,
                           let contents = notification["contents"] as? String,
                           let date = notification["createDate"] as? String{
                            
                            let noti = SystemNotification(id: id, title: title, contents: contents, createDate: date)
                            notificationList.append(noti)
                        }
                    }
                    
                    self.tableview.reloadData()
                }
            }

        }
    }
}

extension SystemNotificationViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationContentsTableViewCell.identifier, for: indexPath) as? NotificationContentsTableViewCell else { fatalError() }
        
        cell.titleLabel.text = notificationList[indexPath.row].title
        cell.dateLabel.text = notificationList[indexPath.row].createDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = SystemNotificationDetailViewController()
        detailViewController.notification = notificationList[indexPath.row]
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//          return UITableView.automaticDimension
//    }
}
