//
//  ViewController.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/13.
//

import UIKit
import Firebase
import FirebaseDatabase

class LoginViewController: UIViewController {

    let loginView = LoginView()
    var errorMessage: String = ""
    
    var userEmail: String?
    var userPassword: String?
    
    override func loadView() {
        super.loadView()
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigations()
        setButtons()
    }
    
    func setNavigations() {
        self.changeNavigationBackButton()
    }
    
    func setButtons() {
        loginView.loginButton.addTarget(self, action: #selector(touchUpLoginButton), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(touchUpRegisterButton), for: .touchUpInside)
        loginView.forgetPasswordButton.addTarget(self, action: #selector(touchUpForgetPasswordButton), for: .touchUpInside)
    }
}

//MARK: - 버튼 addTarget
extension LoginViewController {
    
    //로그인버튼 클릭
    @objc func touchUpLoginButton(_ sender: UIButton) {
        guard validate() else {
            resetTextField()
            return
        }
        //MARK: - 임시 유저 데이터
//        let email: String = "bangtori@naver.com"
//        let password: String = "aaaaaaaa1"
        
        guard let userEmail = userEmail, let userPassword = userPassword else {
            return
        }
        
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) {authResult, error in
            if authResult != nil {
                //SceneDelegate changeRootView 호출
                self.setUserData(userEmail: userEmail)

            } else {
                self.showAlert(message: "등록되지 않은 정보입니다.", yesAction: nil)
                print(error.debugDescription)
            }
        }
    }
    
    //회원가입버튼 클릭
    @objc func touchUpRegisterButton(_ sender: UIButton) {
        let registerViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    //비밀번호 찾기 클릭
    @objc func touchUpForgetPasswordButton(_ sender: UIButton) {
        let forgetPasswordViewController = ForgetPasswordViewController()
        self.navigationController?.pushViewController(forgetPasswordViewController, animated: true)
    }
    
    private func validate() -> Bool{
        guard let userEmail = loginView.emailTextField.text, !userEmail.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.showAlert(message: "이메일을 채워주세요", yesAction: nil)
            return false
        }
        
        guard let userPassword = loginView.passwordTextField.text, !userPassword.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.showAlert(message: "비밀번호를 채워주세요", yesAction: nil)
            return false
        }
        
        //email@aaa.com -> 양식 체크
        guard loginView.emailTextField.text!.contains("@") && loginView.emailTextField.text!.contains(".") else {
            self.showAlert(message: "이메일 형식이 맞지 않습니다.", yesAction: nil)
            return false
        }
        
        self.userEmail = userEmail
        self.userPassword = userPassword
        return true
    }
    
    func resetTextField(){
        loginView.emailTextField.text = ""
        loginView.passwordTextField.text = ""
    }
    
    // 사용자 정보 불러오기
    func setUserData(userEmail: String) {
        let ref = Database.database().reference()
        
        var emailString = userEmail.replacingOccurrences(of: ".", with: "-")
        emailString = emailString.replacingOccurrences(of: "@", with: "-")
        
        //임시 데이터
        ref.child("users")
            .child(emailString).observeSingleEvent(of: .value, with: { snapshot in
                // Get user value
                guard let value = snapshot.value as? NSDictionary else{
                    return
                }
                
                print("\(value)")
                let user = User(email: value["email"] as? String ?? "",
                                name: value["name"] as? String ?? "Name",
                                password: value["password"] as? String ?? "")
                
                UserDefaultsData.shared.setUser(email: user.email, name: user.name, password: user.password)
                
                if user.email == "admin@admin.com"{
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootView(UINavigationController(rootViewController: AdminHomeViewController()), animated: true)
                }else {
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootView(TabBarController(), animated: true)
                }
                
                
            }) { error in
                print(error.localizedDescription)
        }
    }
    
}
