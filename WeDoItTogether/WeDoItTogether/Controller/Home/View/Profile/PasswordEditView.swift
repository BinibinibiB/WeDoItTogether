//
//  PasswordEditView.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/27.
//

import UIKit

class PasswordEditView: UIView {
    lazy var currentPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "현재 비밀번호"
        
        return label
    }()
    
    lazy var currentPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "현재 비밀번호를 입력해주세요."
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var currentPasswordErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "현재 비밀번호와 일치하지 않습니다"
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 15, weight: .light)
        //label.isHidden = true
        
        return label
    }()
    
    lazy var newPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 비밀번호"
        
        return label
    }()
    
    lazy var newPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "새 비밀번호 입력해주세요."
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var newPasswordErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "조합이 이상합니다."
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 15, weight: .light)
        //label.isHidden = true
        
        return label
    }()
    
    lazy var newPasswordCheckTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "영문, 숫자 조합 8자리 이상"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var newPasswordCheckErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호가 일치하지 않습니다."
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 15, weight: .light)
        //label.isHidden = true

        
        return label
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("변경하기", for: .normal)
        
        return button
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
    
    func addViews(){
        [currentPasswordLabel, currentPasswordTextField,currentPasswordErrorLabel, newPasswordLabel, newPasswordTextField, newPasswordErrorLabel, newPasswordCheckTextField, newPasswordCheckErrorLabel, saveButton].forEach { item in
            addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setLayoutConstraints(){
        //현재 비밀번호
        NSLayoutConstraint.activate([
            currentPasswordLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            currentPasswordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            currentPasswordLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            currentPasswordTextField.topAnchor.constraint(equalTo: currentPasswordLabel.bottomAnchor, constant: 10),
            currentPasswordTextField.leadingAnchor.constraint(equalTo: currentPasswordLabel.leadingAnchor),
            currentPasswordTextField.trailingAnchor.constraint(equalTo: currentPasswordLabel.trailingAnchor),
            
            currentPasswordErrorLabel.topAnchor.constraint(equalTo: currentPasswordTextField.bottomAnchor, constant: 10),
            currentPasswordErrorLabel.leadingAnchor.constraint(equalTo: currentPasswordLabel.leadingAnchor),
            currentPasswordErrorLabel.trailingAnchor.constraint(equalTo: currentPasswordLabel.trailingAnchor),
        ])
        
        //새 비밀번호
        NSLayoutConstraint.activate([
            newPasswordLabel.topAnchor.constraint(equalTo: currentPasswordErrorLabel.bottomAnchor, constant: 40),
            newPasswordLabel.leadingAnchor.constraint(equalTo: currentPasswordErrorLabel.leadingAnchor),
            newPasswordLabel.trailingAnchor.constraint(equalTo: currentPasswordErrorLabel.trailingAnchor),
            
            newPasswordTextField.topAnchor.constraint(equalTo: newPasswordLabel.bottomAnchor, constant: 10),
            newPasswordTextField.leadingAnchor.constraint(equalTo: newPasswordLabel.leadingAnchor),
            newPasswordTextField.trailingAnchor.constraint(equalTo: newPasswordLabel.trailingAnchor),
            
            newPasswordErrorLabel.topAnchor.constraint(equalTo: newPasswordTextField.bottomAnchor, constant: 10),
            newPasswordErrorLabel.leadingAnchor.constraint(equalTo: newPasswordTextField.leadingAnchor),
            newPasswordErrorLabel.trailingAnchor.constraint(equalTo: newPasswordTextField.trailingAnchor),
        ])
        
        //새 비밀번호 확인
        NSLayoutConstraint.activate([
            newPasswordCheckTextField.topAnchor.constraint(equalTo: newPasswordErrorLabel.bottomAnchor, constant: 10),
            newPasswordCheckTextField.leadingAnchor.constraint(equalTo: newPasswordErrorLabel.leadingAnchor),
            newPasswordCheckTextField.trailingAnchor.constraint(equalTo: newPasswordErrorLabel.trailingAnchor),
            
            newPasswordCheckErrorLabel.topAnchor.constraint(equalTo: newPasswordCheckTextField.bottomAnchor, constant: 10),
            newPasswordCheckErrorLabel.leadingAnchor.constraint(equalTo: newPasswordCheckTextField.leadingAnchor),
            newPasswordCheckErrorLabel.trailingAnchor.constraint(equalTo: newPasswordCheckTextField.trailingAnchor),
        ])
        
        //변경 버튼
        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            saveButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    
}
