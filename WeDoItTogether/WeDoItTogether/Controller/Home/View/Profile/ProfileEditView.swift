//
//  ProfileEditView.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/22.
//

import UIKit

class ProfileEditView: UIView {
    
    lazy var profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "rays")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var cameraIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "camera.circle.fill")
        imageView.tintColor = .white
        imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    lazy var nameTextField : UITextField = {
        let textFiled = UITextField()
        textFiled.text = "Name"
        textFiled.font = UIFont.systemFont(ofSize: 20)
        textFiled.addSeparator(at: .bottom, color: .gray)
        
        return textFiled
    }()
    
    lazy var characterLimit: UILabel = {
        let label = UILabel()
        label.text = "1~10자 사이로 입력해주세요"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    lazy var editPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 변경하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.setTitleColor(.red, for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .center
        
        return button
    }()
    
    lazy var saveButton: UIBarButtonItem  = {
        let button = UIBarButtonItem()
        button.title = "저장"
        
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
        [profilePhotoImageView, cameraIconImageView, nameTextField, characterLimit, editPasswordButton].forEach { item in
            addSubview(item)
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
        //카메라 아이콘
        NSLayoutConstraint.activate([
            cameraIconImageView.bottomAnchor.constraint(equalTo: profilePhotoImageView.bottomAnchor),
            cameraIconImageView.trailingAnchor.constraint(equalTo: profilePhotoImageView.trailingAnchor),
            cameraIconImageView.heightAnchor.constraint(equalTo: profilePhotoImageView.heightAnchor, multiplier: 0.35),
            cameraIconImageView.widthAnchor.constraint(equalTo: cameraIconImageView.heightAnchor)
        ])
        //Name Label
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: profilePhotoImageView.bottomAnchor, constant: 50),
            nameTextField.centerXAnchor.constraint(equalTo: profilePhotoImageView.centerXAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50)
        ])
        //글자수 제한 label
        NSLayoutConstraint.activate([
            characterLimit.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5),
            characterLimit.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            characterLimit.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor)
        ])
        //비밀번호 변경 버튼
        NSLayoutConstraint.activate([
            editPasswordButton.topAnchor.constraint(equalTo: characterLimit.bottomAnchor, constant: 20),
            editPasswordButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            editPasswordButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor)
        ])
    }
}
