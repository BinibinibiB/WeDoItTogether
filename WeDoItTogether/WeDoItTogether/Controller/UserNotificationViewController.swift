//
//  UserNotificationViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/20.
//

import UIKit

class UserNotificationViewController: UIViewController {

    let tableview = UITableView()
    
    override func loadView() {
        self.view = tableview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    private func configureTableView(){
        tableview.register(NotificationContentsTableViewCell.self, forCellReuseIdentifier: NotificationContentsTableViewCell.identifier)
        tableview.dataSource = self
        tableview.delegate = self
    }
}

extension UserNotificationViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationContentsTableViewCell.identifier, for: indexPath) as? NotificationContentsTableViewCell else { fatalError() }
        cell.categoryLabel.text = "[두잇두잇App만들기]"
        cell.iconImageView.image = UIImage(systemName: "clock.badge")
        cell.iconImageView.image?.withTintColor(.black)
        cell.titleLabel.text = "약속시간이 1시간 남았습니다.ㅇㅇㅇㅇㅇㅇㅇㅇㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㄴㅇ"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
          return UITableView.automaticDimension
    }
}
