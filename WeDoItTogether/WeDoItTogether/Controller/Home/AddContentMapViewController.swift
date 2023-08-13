    //  AddContentMapViewController.swift
    //  WeDoItTogether
    //
    //  Created by 오영석 on 2023/08/07.
    //

    import UIKit
    import MapKit

    class AddContentMapViewController: UIViewController, MKMapViewDelegate, UISearchControllerDelegate {
        
        let addContentMapView = AddContentMapView()
        let customMarkerView = CustomMarkerView()
        let addContentView = AddContentView()
        let userLocation = UserDefaultsData.shared.getLocation()
        let searchCompleter = MKLocalSearchCompleter()
        var centerAnnotation: MKPointAnnotation!
        var isMapMoving = false
        var currentCenterPoint: CLLocationCoordinate2D?
        var currentCentAddress: String = ""
        var searchController: UISearchController!
        var searchResults: Set<String> = []
        var locationResult: String = ""
        var annotationSelectedCallback: ((String) -> Void)?
        
        override func loadView() {
            self.view = addContentMapView
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setLocationMapView()
            setupSearchController()
            setupTableView()
            searchCompleter.delegate = self
            
        }
        
        
        
        func setupSearchController() {
            searchController = UISearchController(searchResultsController: nil)
            searchController.searchBar.placeholder = "주소를 입력해주세요."
            searchController.searchResultsUpdater = self
            
            self.navigationItem.searchController = searchController
            self.navigationItem.title = "장소 선택"
            self.navigationItem.hidesSearchBarWhenScrolling = false
            searchController.delegate = self
        }
        
        func setupTableView() {
            addContentMapView.tableView.isHidden = true
            addContentMapView.tableView.delegate = self
            addContentMapView.tableView.dataSource = self
        }
        
        func willPresentSearchController(_ searchController: UISearchController) {
            addContentMapView.mapView.isHidden = true
            addContentMapView.tableView.isHidden = false
        }
        
        func willDismissSearchController(_ searchController: UISearchController) {
            addContentMapView.mapView.isHidden = false
            addContentMapView.tableView.isHidden = true
        }
        
        func setLocationMapView() {
            addContentMapView.mapView.delegate = self
            addContentMapView.mapView.showsUserLocation = true
            
            let center = CLLocationCoordinate2D(latitude: userLocation.latitude, longitude: userLocation.longitude)
            let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
            addContentMapView.mapView.setRegion(region, animated: true)
            
            centerAnnotation = MKPointAnnotation()
            centerAnnotation.coordinate = center
            addContentMapView.mapView.addAnnotation(centerAnnotation)
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation === centerAnnotation {
                let customMarkerView = CustomMarkerView(annotation: annotation, reuseIdentifier: "CustomMarkerView")
                
                return customMarkerView
            }
            
            return nil
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
        {
            annotationSelectedCallback?(locationResult)
            self.navigationController?.popViewController(animated: true)
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            centerAnnotation.coordinate = mapView.centerCoordinate
            currentCenterPoint = mapView.centerCoordinate
        }
        
        func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
            if !isMapMoving {
                UIView.animate(withDuration: 0.3) {
                    self.centerAnnotation.coordinate.latitude += 0.0005
                }
                isMapMoving = true
            }
        }
        
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            centerAnnotation.coordinate = mapView.centerCoordinate
            
            if isMapMoving {
                UIView.animate(withDuration: 0.3) {
                    self.centerAnnotation.coordinate.latitude -= 0.0005
                    
                }
                isMapMoving = false
            }
            
            if let currentCenterPoint = currentCenterPoint {
                convertLocationToAddress(currentCenterPoint)
            }
            
        }
        
        func convertLocationToAddress(_ coordinate: CLLocationCoordinate2D) {
            let geocoder = CLGeocoder()
            let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            let locale = Locale(identifier: "Ko-kr")
            
            geocoder.reverseGeocodeLocation(location, preferredLocale: locale) { [self] placemarks, error in
                if let error = error {
                    print("Error reverse geocoding: \(error.localizedDescription)")
                    
                    return
                }
                
                guard let placemark = placemarks?.first else {
                    print("No address found.")
                    
                    return
                }
                
                var currentCentAddress = [placemark.locality, placemark.name]
                    .compactMap { $0 }
                    .joined(separator: " ")
                
                if placemark.administrativeArea != "서울특별시" {
                    currentCentAddress = "\(placemark.administrativeArea ?? "")  \(placemark.subAdministrativeArea ?? "")" + currentCentAddress
                }
                self.addContentMapView.currentLocationLabel.text = currentCentAddress
                self.locationResult = currentCentAddress
            }
        }
        
    }

    extension AddContentMapViewController: UISearchResultsUpdating {
        func updateSearchResults(for searchController: UISearchController) {
            guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
                searchResults.removeAll()
                addContentMapView.tableView.reloadData()
                return
            }
            
            searchCompleter.queryFragment = searchText
        }
        
        
        func geocodeAndCenterMap(for selectedLocation: String) {
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = selectedLocation
            
            let search = MKLocalSearch(request: request)
            search.start { response, error in
                if let error = error {
                    print("\(error.localizedDescription)")
                } else {
                    if let mapItem = response?.mapItems.first {
                        let location = mapItem.placemark.coordinate
                        
                        let region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
                        self.addContentMapView.mapView.setRegion(region, animated: true)
                    }
                }
                
                self.searchController.dismiss(animated: true) {
                    self.addContentMapView.mapView.isHidden = false
                    self.addContentMapView.tableView.isHidden = true
                }
            }
        }
    }


    extension AddContentMapViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return searchResults.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            cell.textLabel?.text = searchResults.sorted()[indexPath.row]
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedLocation = searchResults.sorted()[indexPath.row]
            geocodeAndCenterMap(for: selectedLocation)
        }
        
    }

    extension AddContentMapViewController: MKLocalSearchCompleterDelegate {
        func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
            searchResults = Set(completer.results.map { $0.title })
            addContentMapView.tableView.reloadData()
        }
        
        func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
            print("\(error.localizedDescription)")
        }
    }
