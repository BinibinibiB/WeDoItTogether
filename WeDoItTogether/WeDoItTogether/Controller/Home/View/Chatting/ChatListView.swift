//
//  ChattingView.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/14.
//

import UIKit
private let reuseIdentifier = "ChatListCell"
class ChatListView: UIView{

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addViews()
        setLayoutConstraints()
    
        collectionView.register(ChatListCell.self, forCellWithReuseIdentifier: reuseIdentifier)
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
    
   
    func addViews() {
     
        [collectionView].forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            addSubview(item)
        }
    }
    
    func setLayoutConstraints(){
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10),
            
        ])
        
    }
}


