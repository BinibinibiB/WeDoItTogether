//
//  RegisterViewController.swift
//  WeDoItTogether
//
//  Created by 최하늘 on 2023/07/19.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let registerView = RegisterView()
    
    override func loadView() {
        self.view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
