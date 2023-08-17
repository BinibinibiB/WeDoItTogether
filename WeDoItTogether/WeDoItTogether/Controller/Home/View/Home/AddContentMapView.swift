//
//  AddContentMapView.swift
//  WeDoItTogether
//
//  Created by 오영석 on 2023/08/07.
//

import UIKit
import MapKit

class AddContentMapView: UIView {
    
    lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 20
        view.layer.shadowRadius = 3
        
        return view
    }()
    
    lazy var currentLocationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        label.backgroundColor = .white
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var compassButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "scope"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(compassButtonTapped), for: .touchUpInside)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 10
        
        return button
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
        mapView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mapView)
        
        [compassButton, currentLocationLabel, tableView]
            .forEach { item in
                item.translatesAutoresizingMaskIntoConstraints = false
                self.addSubview(item)
            }
    }
    
    func setLayoutConstraints() {
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            compassButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -padding),
            compassButton.bottomAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            
            currentLocationLabel.centerXAnchor.constraint(equalTo: mapView.centerXAnchor),
            currentLocationLabel.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -padding),
            currentLocationLabel.widthAnchor.constraint(equalTo: mapView.widthAnchor, multiplier: 0.6),
            currentLocationLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding - 5),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -padding),
        ])
    }
    
    @objc func compassButtonTapped() {
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
}

