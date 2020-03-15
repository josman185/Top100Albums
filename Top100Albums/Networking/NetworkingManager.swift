//
//  NetworkingManager.swift
//  Top100Albums
//
//  Created by Jose Vargas on 13/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import Foundation
import UIKit

class NetworkingManager: NSObject {
    
    public static let shared = NetworkingManager()
    let urlSession = URLSession.shared
    
    public enum APIServiceError: Error {
        case apiError
        case invalidEndpoint
        case invalidResponse
        case noData
        case decodeError
    }
    
    private func fetchResources(url: URL, completion: @escaping (Result<[Album], APIServiceError>) -> Void) {
        urlSession.dataTask(with: url) { (result) in
           switch result {
               case .success(let (response, data)):
                   guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                       completion(.failure(.invalidResponse))
                       return
                   }
                   do {
                        let values = try JSONDecoder().decode(Feedjson.self, from: data).feed.results
                        completion(.success(values))
                   } catch {
                        completion(.failure(.decodeError))
                   }
               case .failure:
                   completion(.failure(.apiError))
               }
        }.resume()
    }
    
    public func fetchAlbums(result: @escaping (Result<[Album], APIServiceError>) -> Void) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json") else { return }
        fetchResources(url: url, completion: result)
    }
}
