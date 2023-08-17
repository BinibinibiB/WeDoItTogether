//
//  ProfileView.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/14.
//

import UIKit

class ProfileView: UIView {
    lazy var profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "rays")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
    
    lazy var emailLabel : UILabel = {
        let label = UILabel()
        label.text = "ex@example.com"
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    lazy var profileEditButton: UIButton = {
        var titleAttr = AttributedString.init("프로필 수정")
        titleAttr.font = .systemFont(ofSize: 18.0)
        let button = UIButton(configuration: .plain())
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button.configuration?.attributedTitle = titleAttr
        button.configuration?.baseForegroundColor = .black
        button.tintColor = .gray
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .center
        button.addSeparator(at: .top, color: .black)
        
        return button
    }()
    
    lazy var notificationLabel: UILabel = {
        let label = UILabel()
        label.text = "알림 설정"
        label.font = UIFont.systemFont(ofSize: 18)
        label.baselineAdjustment = .alignCenters
        
        return label
    }()
    
    lazy var notificationSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.tintColor = .blue //main색 결정 시 수정 필요
        toggle.layer.cornerRadius = toggle.frame.height / 2.0
        toggle.backgroundColor = .lightGray
        toggle.clipsToBounds = true
        toggle.contentVerticalAlignment = .center

        return toggle
    }()
    
    lazy var logoutButton: UIButton = {
        var titleAttr = AttributedString.init("로그아웃")
        titleAttr.font = .systemFont(ofSize: 18.0)
        let button = UIButton(configuration: .plain())
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button.configuration?.attributedTitle = titleAttr
        button.configuration?.baseForegroundColor = .black
        button.tintColor = .gray
        button.contentHorizontalAlignment = .left
        button.addSeparator(at: .top, color: .black)
        button.addSeparator(at: .bottom, color: .black)
        
        return button
    }()
    
    lazy var notificationView: UIView = {
        let view = UIView()
        view.addSeparator(at: .top, color: .black)
        
        return view
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
        [profilePhotoImageView, nameLabel, emailLabel, profileEditButton, notificationView, logoutButton].forEach{ item in
            addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [notificationLabel, notificationSwitch].forEach{ item in
            notificationView.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setLayoutConstraints(){
        
        //프로필 이미지
        NSLayoutConstraint.activate([
            profilePhotoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            profilePhotoImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            profilePhotoImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            profilePhotoImageView.heightAnchor.constraint(equalTo: profilePhotoImageView.widthAnchor),
        ])
        //Name Label
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profilePhotoImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: profilePhotoImageView.centerXAnchor)
        ])
        //email Label
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            emailLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor)
        ])
        //프로필 수정
        NSLayoutConstraint.activate([
            profileEditButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 40),
            profileEditButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            profileEditButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            profileEditButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        //알림 설정 view
        NSLayoutConstraint.activate([
            notificationView.topAnchor.constraint(equalTo: profileEditButton.bottomAnchor, constant: 0),
            notificationView.leadingAnchor.constraint(equalTo: profileEditButton.leadingAnchor),
            notificationView.trailingAnchor.constraint(equalTo: profileEditButton.trailingAnchor),
            notificationView.heightAnchor.constraint(equalTo: profileEditButton.heightAnchor)
        ])
        //알림 설정 view 내부
        NSLayoutConstraint.activate([
            notificationLabel.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor),
            notificationLabel.leadingAnchor.constraint(equalTo: notificationView.leadingAnchor),
            notificationLabel.trailingAnchor.constraint(equalTo: notificationSwitch.leadingAnchor, constant: -10),
            notificationSwitch.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor),
            notificationSwitch.trailingAnchor.constraint(equalTo: notificationView.trailingAnchor)
        ])
        //로그아웃
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: 0),
            logoutButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoutButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
