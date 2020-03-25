//
//  Constants.swift
//  Top100Albums
//
//  Created by Jose Vargas on 18/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import Foundation

struct UrlConstants {
    static func fetchAlbums(count: Int) -> String {
        return "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/\(count)/explicit.json"
    }
}
