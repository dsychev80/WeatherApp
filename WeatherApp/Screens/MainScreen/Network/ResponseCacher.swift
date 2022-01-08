//
//  ResponseCacher.swift
//  WeatherApp
//
//  Created by Denis Sychev on 08.01.2022.
//

import Alamofire

fileprivate let CACHE_FRESHNESS_VALUE: Double = 60 * 60

final class ResponseCacher: CachedResponseHandler {
    private var cachedUrl: URL?
    private var cachedData: CachedURLResponse?
    private var lastUpdateDate: Date!
    
    private func compareCachedUrlWith(_ url: URL) -> Bool {
        return url == cachedUrl
    }
    
    private func isCachedDataFresh() -> Bool {
        return abs(lastUpdateDate.timeIntervalSinceNow) < CACHE_FRESHNESS_VALUE
    }
    
    public func dataTask(_ task: URLSessionDataTask, willCacheResponse response: CachedURLResponse, completion: @escaping (CachedURLResponse?) -> Void) {
        if let url = task.currentRequest?.url {
            if compareCachedUrlWith(url) && isCachedDataFresh() {
                completion(cachedData)
            } else {
                cachedUrl = url
                cachedData = response
                lastUpdateDate = Date()
                completion(response)
            }
        }
    }
}
