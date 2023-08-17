//
//  DetailContentView.swift
//  WeDoItTogether
//
//  Created by 오영석 on 2023/07/21.
//

import UIKit

class DetailContentView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var detailContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 20
        view.layer.shadowRadius = 3
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "WeDoItTogether[25979:833951] void * _Nullable NSMapGet(NSMapTable * _Nonnull, const void * _Nullable): map table argument is NULL"
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "WeDoItTogether[25979:833951] void * _Nullable NSMapGet(NSMapTable * _Nonnull, const void * _Nullable): map table argument is NULL"
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "WeDoItTogether[25979:833951] void * _Nullable NSMapGet(NSMapTable * _Nonnull, const void * _Nullable): map table argument is NULL"
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    lazy var membersLabel: UILabel = {
        let label = UILabel()
        label.text = "WeDoItTogether[25979:833951] void * _Nullable NSMapGet(NSMapTable * _Nonnull, const void * _Nullable): map table argument is NULL"
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    lazy var memoLabel: UILabel = {
        let label = UILabel()
        label.text = "메모"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    lazy var memoContentLabel: UILabel = {
        let label = UILabel()
        label.text = "WeDoItTogether[25979:833951] void"
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        return collectionView
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton(configuration: .tinted())
        button.setTitle("삭제하기", for: .normal)
        button.isEnabled = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addView()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
    }
    
    func addView() {
        
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        [detailContentView, collectionView, deleteButton].forEach { item in
            contentView.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [titleLabel,
         dateLabel, locationLabel, membersLabel,
         memoLabel,
         memoContentLabel].forEach { item in
            detailContentView.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
    }
    
    func setLayoutConstraints() {
        let padding: CGFloat = 20
        
        //scrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1),
        ])
        
        NSLayoutConstraint.activate([
            detailContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            detailContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            detailContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            collectionView.topAnchor.constraint(equalTo: detailContentView.bottomAnchor, constant: padding),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1),
            
            deleteButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: padding),
            deleteButton.leadingAnchor.constraint(equalTo: detailContentView.leadingAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: detailContentView.trailingAnchor),
            deleteButton.heightAnchor.constraint(equalToConstant: 50),
            deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            //제목
            titleLabel.topAnchor.constraint(equalTo: detailContentView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: detailContentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: detailContentView.trailingAnchor, constant: -padding),
            
            //위치
            locationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            locationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            //날짜
            dateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: locationLabel.trailingAnchor),
            
            //멤버
            membersLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: padding),
            membersLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            membersLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),

            //메모
            memoLabel.topAnchor.constraint(equalTo: membersLabel.bottomAnchor, constant: padding),
            memoLabel.leadingAnchor.constraint(equalTo: membersLabel.leadingAnchor),
            memoLabel.trailingAnchor.constraint(equalTo: membersLabel.trailingAnchor),
            
            memoContentLabel.topAnchor.constraint(equalTo: memoLabel.bottomAnchor),
            memoContentLabel.leadingAnchor.constraint(equalTo: memoLabel.leadingAnchor),
            memoContentLabel.trailingAnchor.constraint(equalTo: memoLabel.trailingAnchor),
            memoContentLabel.bottomAnchor.constraint(equalTo: detailContentView.bottomAnchor, constant: -padding),
        ])
    }
}
