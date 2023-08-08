//
//  SceneDelegate.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var user = UserDefaultsData.shared.getUser()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let loginView = UINavigationController(rootViewController: LoginViewController())
        
        let homeView = TabBarController()
        
        if user != nil && user?.email != "admin@admin.com"{
            print("로그인된 유저 : \(String(describing: user))")
            window?.rootViewController = homeView
        }else if user?.email == "admin@admin.com"{
            window?.rootViewController = UINavigationController(rootViewController: AdminHomeViewController())
        }else {
            window?.rootViewController = loginView
        }
        
        window?.makeKeyAndVisible()
    }
    
    //루트뷰 변경
    func changeRootView(_ viewController: UIViewController, animated: Bool) {
        guard let window = self.window else {
            return
        }
        window.rootViewController = viewController
        UIView.transition(with: window, duration: 0.4, options: [.transitionCrossDissolve], animations: nil, completion: nil)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        //scene이 Active상태가 되었을 때
        //알림 뱃지 없애주기
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

