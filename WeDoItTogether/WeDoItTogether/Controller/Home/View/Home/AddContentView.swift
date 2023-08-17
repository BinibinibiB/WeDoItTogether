//
//  AddContentView.swift
//  WeDoItTogether
//
//  Created by 오영석 on 2023/07/21.
//

import UIKit
import MapKit


class AddContentView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        
        return scrollView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "약속 이름"
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "약속명을 입력하세요."
        textField.borderStyle = .bezel
        textField.font = .systemFont(ofSize: 20)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        
        return textField
    }()
    
    lazy var redTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "약속 일정"
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    lazy var dateResultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        return datePicker
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "약속장소 설정"
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    lazy var searchLocationButton: UIButton = {
        let button = UIButton(configuration: .tinted())
        button.setTitle("장소 설정", for: .normal)
        
        return button
    }()
    
    lazy var locationResultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    lazy var memoLabel: UILabel = {
        let label = UILabel()
        label.text = "메모"
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    lazy var memoTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "메모를 입력하세요."
        textField.borderStyle = .bezel
        textField.font = .systemFont(ofSize: 20)
        textField.backgroundColor = .white
        textField.contentVerticalAlignment = .top
        
        return textField
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
        
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        [titleLabel, titleTextField, redTitleLabel, dateLabel, datePicker, locationLabel, searchLocationButton, locationResultLabel, memoLabel, memoTextField, dateResultLabel]
            .forEach { item in
                item.translatesAutoresizingMaskIntoConstraints = false
                scrollView.addSubview(item)
            }
        
    }
    
    func setLayoutConstraints() {
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: padding + 5),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding - 5),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            titleTextField.heightAnchor.constraint(equalToConstant: 50),
            
            redTitleLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: padding - 5),
            redTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            redTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: padding + 5),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 50),
            
            datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: padding),
            datePicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            dateResultLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 5),
            dateResultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateResultLabel.heightAnchor.constraint(equalToConstant: 50),

        ])
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: dateResultLabel.bottomAnchor, constant: padding + 5 ),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            locationLabel.heightAnchor.constraint(equalToConstant: 50),
            
            searchLocationButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: padding + 5 ),
            searchLocationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            searchLocationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            searchLocationButton.heightAnchor.constraint(equalToConstant: 50),
            
            locationResultLabel.topAnchor.constraint(equalTo: searchLocationButton.bottomAnchor, constant: padding + 5 ),
            locationResultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            locationResultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            locationResultLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        
        
        NSLayoutConstraint.activate([
            memoLabel.topAnchor.constraint(equalTo: locationResultLabel.bottomAnchor, constant: padding + 5),
            memoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            memoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            memoLabel.heightAnchor.constraint(equalToConstant: 50),
            
            memoTextField.topAnchor.constraint(equalTo: memoLabel.bottomAnchor, constant: padding - 5),
            memoTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            memoTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            memoTextField.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        scrollView.contentSize = CGSize(width: self.bounds.width, height: 1000)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateResultLabel.text = formatter.string(from: sender.date)
    }
    
}
