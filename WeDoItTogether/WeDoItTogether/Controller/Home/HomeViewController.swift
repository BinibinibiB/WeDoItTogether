//
//  HomeViewController.swift
//  WeDoItTogether
//
//  Created by 최하늘 on 2023/07/14.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, AddContentDelegate {
    
    let homeView = HomeView()
    var items: [Item] = []
    
    var user = UserDefaultsData.shared.getUser()
    
    convenience init(title: String) {
        self.init()
        self.title = title
        setButtons()
        
    }
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        getDatabaseInfo()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func configureCollectionView() {
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
    }
    
    private func getDatabaseInfo() {
        let ref = Database.database().reference()
        let itemsRef = ref.child("items")
        
        Loading.showLoading()
        items.removeAll()
        itemsRef.observeSingleEvent(of: .value) { (snapshot) in
            guard let items = snapshot.children.allObjects as? [DataSnapshot] else {
                Loading.hideLoading()
                return
            }
            
            for itemSnapshot in items {
                guard let itemInfo = itemSnapshot.value as? [String: Any],
                      let title = itemInfo["title"] as? String,
                      let location = itemInfo["location"] as? String,
                      let memo = itemInfo["memo"] as? String,
                      let date = itemInfo["date"] as? String,
                      let members = itemInfo["members"] as? [String],
                      let emails = itemInfo["emails"] as? [String],
                      let creator = itemInfo["creator"] as? String else {
                    Loading.hideLoading()
                    return
                }
                
                if emails.contains(self.user?.email ?? "") {
                    let item = Item(title: title, date: date, location: location, memo: memo, members: members, emails: emails, creator: creator)
                    self.items.append(item)
                }
            }
            
            self.homeView.collectionView.reloadData()
            Loading.hideLoading()
            
        }
    }
    
    func setButtons() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        self.navigationItem.rightBarButtonItem = addButton
        let calendarButton = UIBarButtonItem(image: UIImage(systemName: "calendar"), style: .plain, target: self, action: #selector(calendarButtonTapped))
        self.navigationItem.leftBarButtonItem = calendarButton
    }
    
    func didSaveItem(_ item: Item) {
        items.append(item)
        homeView.collectionView.reloadData()
    }
    
    @objc private func addButtonTapped() {
        let addContentViewController = AddContentViewController()
        addContentViewController.hidesBottomBarWhenPushed = true
        addContentViewController.delegate = self
        navigationController?.pushViewController(addContentViewController, animated: true)
    }
    
    @objc private func calendarButtonTapped() {
        let calendarViewController = CalendarViewController()
        calendarViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(calendarViewController, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width - 50
        let height: CGFloat = 130
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HomeViewContentCell
        
        let item = items[indexPath.item]
        
        cell.titleLabel.text = item.title
        cell.locationLabel.text = item.location
        cell.dateLabel.text = item.date
        cell.memoLabel.text = "memo: \(item.memo)"
        
        let membersString = item.members.joined(separator: ", ")
        cell.membersLabel.text = membersString
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailContentViewController = DetailContentViewController()
        detailContentViewController.item = items[indexPath.item]
        self.navigationController?.pushViewController(detailContentViewController, animated: true)
    }
}
