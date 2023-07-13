//
//  ViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/13.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .black
        
        loginView.loginButton.addTarget(self, action: #selector(touchUpLoginButton), for: .touchUpInside)
    }
    
    //로그인버튼 클릭
    @objc func touchUpLoginButton(_ sender: UIButton) {

        //SceneDelegate changeRootView 호출
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootView(MainTabBarController(), animated: true)

    }
}

