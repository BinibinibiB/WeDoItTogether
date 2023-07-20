//
//  PasswordFindVIew.swift
//  WeDoItTogether
//
//  Created by 신희권 on 2023/07/14.
//

import Foundation
import UIKit

class PasswordFindView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호를 잊어버리셨나요?"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "걱정마세요, 저 애플펀치가 찾아드립니다.\n이메일 주소를 입력하시면 임시 비밀번호를 발급해드립니다."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.gray
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "ex@email.com"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var findPasswordButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("임시 비밀번호 받기", for: .normal)
        
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
    }
    
    func addView() {
        [emailLabel, emailTextField,contentLabel,titleLabel,findPasswordButton].forEach { view in
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            contentLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 60),
            emailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50)
            
        ])
        NSLayoutConstraint.activate([
            findPasswordButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            findPasswordButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            findPasswordButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -25)
        ])
    }
}
