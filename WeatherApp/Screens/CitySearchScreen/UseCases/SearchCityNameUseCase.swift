import MapKit

final class SearchCityNameUseCase: NSObject {
    
    var completer = MKLocalSearchCompleter()
    var locationManager: CLLocationManager?
    var completionResults: [MKLocalSearchCompletion] = []
    
    var userLocation: CLLocation?
    
    var cityResults: [String] = [] {
        didSet {
            (0..<cityResults.count).forEach { cityName in
                print(cityName)
            }
        }
    }
    
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
    
    private func getCoordinates() {
        guard let userCoordinates = userLocation else { fatalError("💩There is no coordinates!!!") }
        let coordinations = CLLocationCoordinate2D(latitude: userCoordinates.coordinate.latitude, longitude: userCoordinates.coordinate.longitude)
        completer.region = MKCoordinateRegion(center: coordinations, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    }
    
}

extension SearchCityNameUseCase: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.userLocation = locations.first
        getCoordinates()
    }
}

extension SearchCityNameUseCase: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        completionResults = completer.results
        if completionResults.count > 0 {
            completionResults.forEach { result in
                print(result.title)
            }
        }
    }
}
