//
//  AdminHomeView.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/07.
//

import UIKit

class AdminHomeView: UIView {
    lazy var adminLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "admin")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var adminLabel: UILabel = {
        let label = UILabel()
        label.text = "관리자 페이지"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        return label
    
    }()
    
    lazy var notificationManagementButton: UIButton = {
        let button = UIButton(configuration: .plain())
        var titleAttr = AttributedString.init("공지 관리")
        titleAttr.font = .systemFont(ofSize: 20.0)
        button.configuration?.attributedTitle = titleAttr
        button.configuration?.baseForegroundColor = .black
        button.tintColor = .gray
        
        return button
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton(configuration: .plain())
        var titleAttr = AttributedString.init("로그아웃")
        titleAttr.font = .systemFont(ofSize: 20.0)
        button.configuration?.attributedTitle = titleAttr
        button.configuration?.baseForegroundColor = .black
        button.tintColor = .gray
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addViews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addViews() {
        [adminLogoImageView, adminLabel, notificationManagementButton, logoutButton].forEach { item in
            addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setLayoutConstraints(){
        //logo
        NSLayoutConstraint.activate([
            adminLogoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            adminLogoImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            adminLogoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            adminLogoImageView.heightAnchor.constraint(equalTo: adminLogoImageView.widthAnchor, multiplier: 0.5)
        ])
        //Label
        NSLayoutConstraint.activate([
            adminLabel.topAnchor.constraint(equalTo: adminLogoImageView.bottomAnchor, constant: 20),
            adminLabel.leadingAnchor.constraint(equalTo: adminLogoImageView.leadingAnchor),
            adminLabel.trailingAnchor.constraint(equalTo: adminLogoImageView.trailingAnchor),
        ])
        
        //buttons
        NSLayoutConstraint.activate([
            notificationManagementButton.topAnchor.constraint(equalTo: adminLabel.bottomAnchor, constant: 20),
            notificationManagementButton.leadingAnchor.constraint(equalTo: adminLogoImageView.leadingAnchor),
            notificationManagementButton.trailingAnchor.constraint(equalTo: adminLogoImageView.trailingAnchor),
            
            logoutButton.topAnchor.constraint(equalTo: notificationManagementButton.bottomAnchor, constant: 10),
            logoutButton.leadingAnchor.constraint(equalTo: adminLogoImageView.leadingAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: adminLogoImageView.trailingAnchor),
        ])
    }
}
