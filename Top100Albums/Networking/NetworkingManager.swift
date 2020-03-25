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
    
    // MARK: - Properties
    public static let shared = NetworkingManager()
    let urlSession = URLSession.shared
    
    public enum APIServiceError: Error {
        case apiError
        case invalidResponse
        case decodeError
    }
    
    // MARK: - APIrequest
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
        let stringURL = UrlConstants.fetchAlbums(count: 20)
        guard let url = URL(string: stringURL) else { return }
        fetchResources(url: url, completion: result)
    }
}
