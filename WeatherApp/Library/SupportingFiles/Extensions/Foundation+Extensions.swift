//
//  Foundation+Extensions.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Foundation


extension URL {
    func appendingParameters(_ parameters: [String: String]) -> URL? {
        if var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false) {
            var queryItems = urlComponents.queryItems
            for key in parameters.keys {
                queryItems?.append(URLQueryItem(name: key, value: parameters[key]))
            }
            urlComponents.queryItems = queryItems
            return urlComponents.url
        } else {
            return self
        }
    }
}
