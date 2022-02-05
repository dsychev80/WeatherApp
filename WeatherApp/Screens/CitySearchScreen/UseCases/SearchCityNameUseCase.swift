import MapKit

final class SearchCityNameUseCase: NSObject {
    
    var completer = MKLocalSearchCompleter()
    var locationManager: CLLocationManager?
    
    var cityResults: [String]?
    var completion: (([String]) -> Void)?
    
    override init() {
        super.init()
        
        setup()
    }
    
    private func setup() {
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.requestAlwaysAuthorization()
            locationManager?.startUpdatingLocation()
        }
        
        completer.delegate = self
    }
    
    private func convertToCityNames(_ results: [MKLocalSearchCompletion]) -> [String] {
        var cityNames: [String] = []
        if results.count > 0 {
            results.forEach { result in
                cityNames.append(result.title)
            }
        }
        return cityNames
    }
    
    public func getCityNames(contains city: String, completion: @escaping ([String]) -> Void) {
        completer.queryFragment = city
        self.completion = completion
    }
    
}

extension SearchCityNameUseCase: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = manager.location!.coordinate
        completer.region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 10000, longitudeDelta: 10000))
    }
}

extension SearchCityNameUseCase: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        let completionResults = completer.results
        self.cityResults = convertToCityNames(completionResults)
        if let completion = completion, let cities = cityResults {
            completion(cities)
        }
    }
}
