//
//  NotificationView.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/14.
//

import UIKit

class NotificationView: UIView {
    lazy var tabSegmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.selectedSegmentTintColor = .clear
        // 배경색 제거
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        // segment 구분 라인 제거
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        // 요소 추가
        segment.insertSegment(withTitle: "공지", at: 0, animated: true)
        segment.insertSegment(withTitle: "나의 약속", at: 1, animated: true)
        
        // 초기 선택 요소 지정
        segment.selectedSegmentIndex = 0
        
        return segment
    }()

    lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    lazy var leadingDistance: NSLayoutConstraint = {
        return underLineView.leadingAnchor.constraint(equalTo: tabSegmentedControl.leadingAnchor)
    }()
    
    lazy var segmentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var contentsView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    lazy var pageViewController: UIPageViewController = {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.view.frame = contentsView.frame
        
        return pageController
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addViews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        [tabSegmentedControl, underLineView].forEach{ item in
            segmentView.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [segmentView, contentsView].forEach{ item in
            addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        contentsView.addSubview(pageViewController.view)
        
    }
    
    func setLayoutConstraints(){
        NSLayoutConstraint.activate([
            segmentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            segmentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            segmentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentView.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            contentsView.topAnchor.constraint(equalTo: segmentView.bottomAnchor, constant: 0),
            contentsView.leadingAnchor.constraint(equalTo: segmentView.leadingAnchor),
            contentsView.trailingAnchor.constraint(equalTo: segmentView.trailingAnchor),
            contentsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            tabSegmentedControl.topAnchor.constraint(equalTo: segmentView.topAnchor),
            tabSegmentedControl.leadingAnchor.constraint(equalTo: segmentView.leadingAnchor),
            tabSegmentedControl.centerXAnchor.constraint(equalTo: segmentView.centerXAnchor),
            tabSegmentedControl.centerYAnchor.constraint(equalTo: segmentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            underLineView.bottomAnchor.constraint(equalTo: tabSegmentedControl.bottomAnchor),
            underLineView.heightAnchor.constraint(equalToConstant: 2),
            leadingDistance,
            underLineView.widthAnchor.constraint(equalTo: tabSegmentedControl.widthAnchor, multiplier: 1 / CGFloat(tabSegmentedControl.numberOfSegments))
        ])
        
    }
}
