//
//  NotificationContentsTableViewCell.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/19.
//

import UIKit

class NotificationContentsTableViewCell: UITableViewCell {
    static let identifier = "NotificationContentsTableViewCell"

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "megaphone")
        imageView.tintColor = .red
        
        return imageView
    }()
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "[공지사항]"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "업데이트 관련 공지사항입니다."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023.07.19"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func addViews() {
        [iconImageView, categoryLabel, titleLabel, dateLabel].forEach { item in
            addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setLayoutConstraints(){
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            iconImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 5),
            categoryLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            dateLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
