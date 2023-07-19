//
//  SystemNotificationViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/19.
//

import UIKit

class SystemNotificationViewController: UIViewController {

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

extension SystemNotificationViewController : UITableViewDataSource, UITableViewDelegate{
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
