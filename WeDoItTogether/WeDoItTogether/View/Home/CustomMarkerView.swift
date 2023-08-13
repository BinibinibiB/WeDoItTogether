//
//  CustomMarkerView.swift
//  WeDoItTogether
//
//  Created by 오영석 on 2023/08/07.
//

import MapKit

class CustomMarkerView: MKAnnotationView {
    
    lazy var markerView: UIImageView = {
        let markerView = UIImageView(image: UIImage(systemName: "pin.fill"))
        markerView.tintColor = .blue
        markerView.contentMode = .scaleAspectFit
        markerView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        return markerView
    }()
    
    lazy var markerButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("핀을 탭해 장소결정", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 10
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        button.configuration = configuration
        button.backgroundColor = .gray.withAlphaComponent(0.5)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.sizeToFit()
        
        return button
    }()
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        addViews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        [markerView, markerButton].forEach { item in
            addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        self.frame = markerView.frame
        self.centerOffset = CGPoint(x: 0, y: -markerView.bounds.size.height)
    }
    
    func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            markerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            markerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            markerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            markerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            markerButton.centerXAnchor.constraint(equalTo: markerView.centerXAnchor),
            markerButton.bottomAnchor.constraint(equalTo: markerView.topAnchor, constant: -5)
        ])
    }
    
}
