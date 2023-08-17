//
//  NotificationAddView.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/07.
//

import UIKit

class NotificationAddView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "공지 제목"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "공지의 제목을 적어주세요."
        
        return textField
    }()
    
    lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.text = "공지 내용"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    lazy var contentsTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        
        return textView
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
        [titleLabel, titleTextField, contentsLabel, contentsTextView].forEach { item in
            addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setLayoutConstraints(){
        //Title
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            titleTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            titleTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
        
        //contents
        NSLayoutConstraint.activate([
            contentsLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 30),
            contentsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            contentsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            contentsTextView.topAnchor.constraint(equalTo: contentsLabel.bottomAnchor, constant: 10),
            contentsTextView.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            contentsTextView.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor),
            contentsTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
}
