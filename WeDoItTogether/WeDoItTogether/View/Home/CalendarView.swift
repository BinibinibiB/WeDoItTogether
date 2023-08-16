//
//  CalendarView.swift
//  WeDoItTogether
//
//  Created by 오영석 on 2023/08/16.
//


import UIKit

class CalendarView: UIView {
    
    lazy var dateView: UICalendarView = {
        var view = UICalendarView()
        view.wantsDateDecorations = true
        
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.tintColor = .black
        
        return tableView
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
        [dateView, tableView].forEach { item in
            addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
    }
    
    func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            dateView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            dateView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            dateView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            dateView.heightAnchor.constraint(equalToConstant: 400),
            
            tableView.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 10),
        ])
        
    }
}
