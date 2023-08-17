//
//  SystemNotificationDetailView.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/07.
//

import UIKit

class SystemNotificationDetailView: UIView {
    var user = UserDefaultsData.shared.getUser()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "[공지사항]"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "공지 제목입니다."
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.addSeparator(at: .bottom, color: .gray)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        
        return scrollView
    }()
    
    lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.text = "내용입니다~ \n예? 내용이라구요~ \n 공지사항이에요~"
        label.numberOfLines = 0
        
        return label
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
    
    private func addViews() {
        [categoryLabel, titleLabel, contentsLabel].forEach { item in
            addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setLayoutConstraints() {
        //category + title
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            categoryLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            categoryLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            titleLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: categoryLabel.trailingAnchor)
        ])
        
        //contents
        NSLayoutConstraint.activate([
            contentsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            contentsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            contentsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
}
