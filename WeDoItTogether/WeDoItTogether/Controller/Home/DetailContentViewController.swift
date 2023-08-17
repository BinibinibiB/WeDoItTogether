//
//  DetailContentViewController.swift
//  WeDoItTogether
//
//  Created by 오영석 on 2023/07/21.
//

import UIKit
import MapKit
import Firebase
import KakaoSDKCommon
import KakaoSDKTemplate
import KakaoSDKShare
import SafariServices

class DetailContentViewController: UIViewController, MKMapViewDelegate {
    
    let detailContentView = DetailContentView()
    var item: Item?
    var user = UserDefaultsData.shared.getUser()
    
    var safariViewController: SFSafariViewController?
    
    let userLocation = UserDefaultsData.shared.getLocation()
    
    override func loadView() {
        super.loadView()
        self.view = detailContentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUILabel()
        configureTableView()
        setButtons()
        barButton()
    }
    
    func updateUILabel() {
        detailContentView.titleLabel.text = item?.title
        detailContentView.locationLabel.text = item?.location
        detailContentView.dateLabel.text = item?.date
        let membersString = item?.members.joined(separator: ", ") ?? ""
        detailContentView.membersLabel.text = membersString
    }
    
    private func configureTableView() {
        detailContentView.collectionView.register(MapCollectionViewCell.self, forCellWithReuseIdentifier: MapCollectionViewCell.identifier)
        detailContentView.collectionView.dataSource = self
        detailContentView.collectionView.delegate = self
    }
    
    private func setButtons() {
        guard let user = user else { return }
        guard item?.creator == user.email else {
            return
        }
        
        detailContentView.deleteButton.isEnabled = true
        detailContentView.deleteButton.addTarget(self, action: #selector(touchUpDeleteButton), for: .touchUpInside)
    }
    
    @objc func touchUpDeleteButton() {
        self.showAlert(message: "약속을 삭제하시겠습니까?", isCancelButton: true) {
            self.deleteItem()
        }
    }
    
    private func deleteItem() {
        guard let item = item else {
            return
        }
        
        let ref = Database.database().reference()
        let itemRefToDelete = ref.child("items").child(item.id.uuidString)
        
        itemRefToDelete.removeValue { error, _ in
            if let error = error {
                print("Error deleting item: \(error.localizedDescription)")
            } else {
                print("Item deleted successfully.")
            }
        }
    }
    
    func barButton() {
        let joinButton = UIBarButtonItem(title: "초대하기", style: .plain, target: self, action: #selector(kakao))
        navigationItem.rightBarButtonItem = joinButton
    }
    
    @objc private func joinButtonClicked() {
        print("hello world")
        
    }
    
    @objc func kakao() {
        // 웹 링크입니다. 카카오톡 인앱 브라우저에서 열립니다.
        let link = Link(webUrl: URL(string: "https://developers.kakao.com"),
                        mobileWebUrl: URL(string: "https://developers.kakao.com"))
        
        // 앱 링크입니다. 파라미터를 함께 전달하여 앱으로 들어왔을 때 특정 페이지로 이동할 수 있는 역할을 합니다.
        let appLink = Link(androidExecutionParams: ["key1": "value1", "key2": "value2"],
                           iosExecutionParams: ["key1": "value1", "key2": "value2"])
        
        // 버튼들 입니다.
        let webButton = Button(title: "웹으로 보기", link: link)
        let appButton = Button(title: "앱으로 보기", link: appLink)
        
        // 메인이 되는 사진, 이미지 URL, 클릭 시 이동하는 링크를 설정합니다.
        let content = Content(title: "딸기 치즈 케익",
                              imageUrl: URL(string: "https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png")!,
                              link: link)
        
        let template = FeedTemplate(content: content, buttons: [webButton, appButton])
        
        // 메시지 템플릿 encode
        if let templateJsonData = (try? SdkJSONEncoder.custom.encode(template)) {
            // 생성한 메시지 템플릿 객체를 jsonObject로 변환
            if let templateJsonObject = SdkUtils.toJsonObject(templateJsonData) {
                
                // 카카오톡 앱이 있는지 체크합니다.
                if ShareApi.isKakaoTalkSharingAvailable() {
                    ShareApi.shared.shareDefault(templateObject: templateJsonObject) {(linkResult, error) in
                        if let error = error {
                            print("error : \(error)")
                        }
                        else {
                            print("defaultLink(templateObject:templateJsonObject) success.")
                            guard let linkResult = linkResult else { return }
                            UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                        }
                    }
                    
                } else {
                    print("카카오톡 미설치")
                    if let url = ShareApi.shared.makeDefaultUrl(templateObject: templateJsonObject) {
                        self.safariViewController = SFSafariViewController(url: url)
                        self.safariViewController?.modalTransitionStyle = .crossDissolve
                        self.safariViewController?.modalPresentationStyle = .overCurrentContext
                        self.present(self.safariViewController!, animated: true) {
                            print("웹 present success")
                        }
                    }
                }
            }
        }
    }
}

//MARK: - 컬렉션뷰 관련
extension DetailContentViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapCollectionViewCell.identifier, for: indexPath) as? MapCollectionViewCell else { fatalError() }
        cell.mapView.delegate = self
        
        let center = CLLocationCoordinate2D(latitude: userLocation.latitude, longitude: userLocation.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        cell.mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = "나 여기임"
        
        cell.mapView.addAnnotation(pin)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: Double = self.view.frame.width
        
        return CGSize(width: width, height: width)
    }
}
