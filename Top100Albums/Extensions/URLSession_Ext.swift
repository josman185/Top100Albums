//
//  URLSession_Ext.swift
//  Top100Albums
//
//  Created by Jose Vargas on 14/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import Foundation

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
    return dataTask(with: url) { (data, response, error) in
        if let error = error {
            result(.failure(error))
            return
        }
        guard let response = response, let data = data else {
            let error = NSError(domain: "error", code: 0, userInfo: nil)
            result(.failure(error))
            return
        }
            result(.success((response, data)))
        }
    }
}
