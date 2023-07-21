//
//  HomeViewController.swift
//  WeDoItTogether
//
//  Created by 최하늘 on 2023/07/14.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    
    convenience init(title: String) {
        self.init()
        self.title = title
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        
        navigationItem.rightBarButtonItem = addButton
    }
    
    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @objc private func addButtonTapped() {
        print("Add button tapped")
    }
}
