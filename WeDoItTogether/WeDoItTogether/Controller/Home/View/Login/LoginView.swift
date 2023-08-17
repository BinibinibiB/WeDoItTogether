//
//  MainView.swift
//  Bibim
//
//  Created by 방유빈 on 2023/07/07.
//

import UIKit

class LoginView: UIView {
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        return imageView
    }()
    
    lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email을 입력해주세요."
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password를 입력해주세요."
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(configuration: .tinted())
        button.setTitle("로그인", for: .normal)
        
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.setTitle("회원가입", for: .normal)
        
        return button
    }()
    
    lazy var forgetPasswordButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.setTitle("비밀번호 찾기", for: .normal)
        
        return button
    }()
    lazy var totalView: UIView = {
        let view = UIView()
        
        return view
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
    
    func addViews(){
        addSubview(totalView)
        totalView.translatesAutoresizingMaskIntoConstraints = false
        
        [logoImageView, emailTextField, signInLabel, emailLabel, passwordLabel ,passwordTextField, loginButton, loginButton, registerButton, forgetPasswordButton].forEach { item in
            totalView.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    //MARK: - 제약조건 설정
    func setLayoutConstraints() {
        //totalView
        NSLayoutConstraint.activate([
            totalView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            totalView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            totalView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            totalView.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            totalView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        
        //imgView
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: totalView.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: totalView.centerXAnchor),
            logoImageView.leadingAnchor.constraint(greaterThanOrEqualTo: totalView.leadingAnchor, constant: 50),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
        ])
        
        //email label + TextField
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            signInLabel.leadingAnchor.constraint(equalTo: totalView.leadingAnchor, constant: 30),
            emailLabel.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 15),
            emailLabel.leadingAnchor.constraint(equalTo: signInLabel.leadingAnchor),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: signInLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: totalView.trailingAnchor, constant: -30),
        ])
        
        //password label + TextField
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordLabel.leadingAnchor.constraint(equalTo: signInLabel.leadingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: signInLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: totalView.trailingAnchor, constant: -30),
        ])
        
        //button
        NSLayoutConstraint.activate([
            //로그인버튼
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            //비밀번호찾기 버튼
            forgetPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            forgetPasswordButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            forgetPasswordButton.bottomAnchor.constraint(equalTo: registerButton.bottomAnchor),
            //회원가입 버튼
            registerButton.topAnchor.constraint(equalTo: forgetPasswordButton.topAnchor),
            registerButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: totalView.bottomAnchor)
        ])
    }
}
