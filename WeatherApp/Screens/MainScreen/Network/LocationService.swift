//
//  LocationService.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import CoreLocation


final class LocationManagerImpl: LocationService {
    
    func getCityCoordinatesByName(_ name: String, completion: @escaping (Result<LocationData, WeatherError>) -> Void) {
        CLGeocoder().geocodeAddressString(name) { placeMarcs, error in
            guard error == nil else {
                print("guard condition not met at: \(#file) \(#line) \(#function)")
                completion(.failure(WeatherError.errorFromLocationServer(error?.localizedDescription ?? "Error from CLGeocoder")))
                return
            }
            
            guard let location = placeMarcs?.first?.location else {
                completion(.failure(WeatherError.missingLocation("Where is no place mark to entered city... Try another one.")))
                return
            }
            let locationData = LocationData(longitude: location.coordinate.longitude,
                                            lattitude: location.coordinate.latitude)
            completion(.success(locationData))
        }
    }
}
