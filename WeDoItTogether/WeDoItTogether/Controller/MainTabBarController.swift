//
//  MainTabBarController.swift
//  WeDoItTogether
//
//  Created by 최하늘 on 2023/07/14.
//

import UIKit

//메인탭바 컨트롤러
class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //홈뷰 네비게이션 컨트롤러로 생성
        let homeVC = UINavigationController.init(rootViewController: HomeViewController(title: "home"))
        
        //탭바에 컨트롤러 추가
        self.viewControllers = [homeVC]
        
        //탭바 아이콘 설정
        let homeTabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 0)
        
        //탭바 아이콘 추가
        homeVC.tabBarItem = homeTabBarItem

    }
}
