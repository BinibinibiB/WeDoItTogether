//
//  AdminHomeViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/07.
//

import UIKit
import FirebaseAuth

class AdminHomeViewController: UIViewController {
    let adminHomeView = AdminHomeView()
    
    override func loadView() {
        super.loadView()
        self.view = adminHomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
    }
    
    private func setButton(){
        adminHomeView.notificationManagementButton.addTarget(self, action: #selector(touchUpNotificationManagement), for: .touchUpInside)
        adminHomeView.logoutButton.addTarget(self, action: #selector(touchUpLogoutButton), for: .touchUpInside)
    }
}

//MARK: - button
extension AdminHomeViewController {
    @objc func touchUpNotificationManagement(){
        let notificationMangementViewController = NotificationManagementViewController()
        self.navigationController?.pushViewController(notificationMangementViewController, animated: true)
    }
    
    @objc func touchUpLogoutButton(){
        self.showAlert(message: "로그아웃 하시겠습니까?", isCancelButton: true) {
            do {
              try Auth.auth().signOut()
                UserDefaultsData.shared.removeAll()
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootView(UINavigationController(rootViewController: LoginViewController()), animated: true)
            } catch let signOutError as NSError {
              print ("Error signing out: %@", signOutError)
          }
        }
    }
}
