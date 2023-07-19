//
//  NotificationViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/14.
//

import UIKit

class NotificationViewController: UIViewController {
    let notificationView = NotificationView()
    let viewControllers = [SystemNotificationViewController(), UserNotificationViewController()]
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
    
    override func loadView() {
        self.view = notificationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationView.tabSegmentedControl.addTarget(self, action: #selector(changeUnderLinePosition), for: .valueChanged)
        configurePageView()
        // Do any additional setup after loading the view.
    }
    
    func configurePageView(){
        notificationView.pageViewController.setViewControllers([viewControllers[notificationView.tabSegmentedControl.selectedSegmentIndex]], direction: .reverse, animated: true)
        
        self.addChild(notificationView.pageViewController)
        
//        notificationView.pageViewController.dataSource = self
//        notificationView.pageViewController.delegate = self
    }
    
    @objc private func changeUnderLinePosition() {
        let segmentIndex = CGFloat(notificationView.tabSegmentedControl.selectedSegmentIndex)

        let segmentWidth = notificationView.tabSegmentedControl.frame.width / CGFloat(notificationView.tabSegmentedControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.notificationView.leadingDistance.constant = leadingDistance
            self?.view.layoutIfNeeded()
        })
        notificationView.pageViewController.setViewControllers([viewControllers[notificationView.tabSegmentedControl.selectedSegmentIndex]], direction: segmentIndex == 1.0 ? .forward : .reverse, animated: true)
        
    }
 
}

//extension NotificationViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
//    //왼쪽에서 오른쪽으로 스와이프 하기 직전에 호출 > 직전에 다음 화면에 어떤 ViewController가 표출될지 결정
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//
//    }
//
//    //오른쪽에서 왼쪽으로 스와이프 하기 직전에 호출 > 직전에 다음 화면에 어떤 ViewController가 표출될지 결정
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//
//    }
//
//
//}
