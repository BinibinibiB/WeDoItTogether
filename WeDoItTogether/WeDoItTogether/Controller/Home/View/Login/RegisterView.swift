//
//  RegisterView.swift
//  WeDoItTogether
//
//  Created by 최하늘 on 2023/07/19.
//

import UIKit

class RegisterView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "회원이 되어보세요~"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        
        return label
    }()
    
    //이메일
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.textColor = .black
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "ex@email.com"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var emailAuthButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("인증", for: .normal)
        
        return button
    }()
    
    //인증번호
    lazy var authNumLabel: UILabel = {
        let label = UILabel()
        label.text = "인증번호"
        label.textColor = .black
        
        return label
    }()
    
    lazy var authNumTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "ex@email.com"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var authNumCheckButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("인증", for: .normal)
        
        return button
    }()
    
    //이름
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = .black
        
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "김아무개"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    //비밀번호
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.textColor = .black
        
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "영문, 숫자 조합 8자리 이상"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "조합이 이상합니다. 나중에 숨길 예정"
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.isHidden = true
        
        return label
    }()
    
    //비밀번호확인
    lazy var passwordCheckLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 확인"
        label.textColor = .black
        
        return label
    }()
    
    lazy var passwordCheckTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "영문, 숫자 조합 8자리 이상"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var passwordCheckErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호가 일치하지 않습니다. 나중에 숨길 예정"
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.isHidden = true
        
        return label
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("가입하기", for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addView()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addView() {
        //self 추가
        [scrollView, registerButton].forEach { item in
            self.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //scrollView 추가
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        //contentView 추가
        [titleLabel,
         emailLabel, emailTextField, emailAuthButton,
         authNumLabel, authNumTextField, authNumCheckButton,
         nameLabel, nameTextField,
         passwordLabel, passwordTextField, passwordErrorLabel,
         passwordCheckLabel, passwordCheckTextField, passwordCheckErrorLabel].forEach { item in
            contentView.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }
            
    func setLayoutConstraints() {
        //scrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: registerButton.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1),
        ])
        
        //titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        ])
        
        //이메일 label + textField + button
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 240),
            
            emailAuthButton.topAnchor.constraint(equalTo: emailTextField.topAnchor),
            emailAuthButton.leadingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: 20),
            emailAuthButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
        ])
        
        //인증번호 label + textField + button
        NSLayoutConstraint.activate([
            authNumLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40),
            authNumLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authNumLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            authNumTextField.topAnchor.constraint(equalTo: authNumLabel.bottomAnchor, constant: 10),
            authNumTextField.leadingAnchor.constraint(equalTo: authNumLabel.leadingAnchor),
            authNumTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            
            authNumCheckButton.topAnchor.constraint(equalTo: authNumTextField.topAnchor),
            authNumCheckButton.leadingAnchor.constraint(equalTo: authNumTextField.trailingAnchor, constant: 20),
            authNumCheckButton.trailingAnchor.constraint(equalTo: authNumLabel.trailingAnchor),
        ])
        
        //이름 label + textField
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: authNumTextField.bottomAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
        
        //비밀번호 label + textField + errorLabel
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40),
            passwordLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor),
            
            passwordErrorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            passwordErrorLabel.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordErrorLabel.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor),
        ])
        
        //비밀번호확인 label + textField + errorLabel
        NSLayoutConstraint.activate([
            passwordCheckLabel.topAnchor.constraint(equalTo: passwordErrorLabel.bottomAnchor, constant: 20),
            passwordCheckLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            passwordCheckLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            passwordCheckTextField.topAnchor.constraint(equalTo: passwordCheckLabel.bottomAnchor, constant: 10),
            passwordCheckTextField.leadingAnchor.constraint(equalTo: passwordCheckLabel.leadingAnchor),
            passwordCheckTextField.trailingAnchor.constraint(equalTo: passwordCheckLabel.trailingAnchor),
            passwordCheckTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            
            passwordCheckErrorLabel.topAnchor.constraint(equalTo: passwordCheckTextField.bottomAnchor, constant: 10),
            passwordCheckErrorLabel.leadingAnchor.constraint(equalTo: passwordCheckLabel.leadingAnchor),
            passwordCheckErrorLabel.trailingAnchor.constraint(equalTo: passwordCheckLabel.trailingAnchor),
        ])
        
        //가입버튼
        NSLayoutConstraint.activate([
            registerButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            registerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
}
