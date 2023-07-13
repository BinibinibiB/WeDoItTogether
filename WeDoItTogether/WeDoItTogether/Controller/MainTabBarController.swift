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
        let chattingVC = UINavigationController.init(rootViewController: ChattingViewController(title: "chatting"))
        let notificationVC = UINavigationController.init(rootViewController: NotificationViewController(title: "notification"))
        let profileVC = UINavigationController.init(rootViewController: ProfileViewController(title: "profile"))
        //탭바에 컨트롤러 추가
        self.viewControllers = [homeVC, chattingVC, notificationVC, profileVC]
        
        //탭바 아이콘 설정
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        let chattingTabBarItem = UITabBarItem(title: "Chatting", image: UIImage(systemName: "message.fill"), tag: 1)
        let notificationTabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "bell.fill"), tag: 2)
        let profileTabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "person.fill"), tag: 3)
        //탭바 아이콘 추가
        homeVC.tabBarItem = homeTabBarItem
        chattingVC.tabBarItem = chattingTabBarItem
        notificationVC.tabBarItem = notificationTabBarItem
        profileVC.tabBarItem = profileTabBarItem

    }
}
