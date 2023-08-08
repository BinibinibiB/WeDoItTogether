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

    override func loadView() {
        super.loadView()
        self.view = systemNotificationDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        // Do any additional setup after loading the view.
    }
    
    private func setLabel(){
        systemNotificationDetailView.titleLabel.text = titleLabel
        systemNotificationDetailView.contentsLabel.text = contentsLabel
    }

}
