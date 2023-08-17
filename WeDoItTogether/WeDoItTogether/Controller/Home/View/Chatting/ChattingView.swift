//
//  ChattingView.swift
//  WeDoItTogether
//
//  Created by 신희권 on 2023/08/02.
//

import UIKit

private let reuseIdentifier = "ChattingCell"
class ChattingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        setLayoutConstraints()
        self.backgroundColor = .white
        collectionView.register(ChattingCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    lazy var inputTextFeild: UITextField = {
        let textField = UITextField()
        textField.placeholder = "메시지를 입력하세요"
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("보내기", for: .normal)
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    
   
    func addViews() {
        [collectionView, inputTextFeild, sendButton].forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            addSubview(item)
        }
    }
    
    func setLayoutConstraints(){
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
           
            inputTextFeild.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            inputTextFeild.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5),
//            inputTextFeild.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5),
            inputTextFeild.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -5),
            
            sendButton.topAnchor.constraint(equalTo: inputTextFeild.topAnchor),
            sendButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            sendButton.leadingAnchor.constraint(equalTo: inputTextFeild.trailingAnchor, constant: -10),
            sendButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -5)
            
        ])
        
    }
}
