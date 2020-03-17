//
//  Album.swift
//  Top100Albums
//
//  Created by Jose Vargas on 13/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import Foundation

struct Feedjson: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [Album]
}

struct Album: Decodable {
    let artistName: String
    let releaseDate: String
    let name: String
    let copyright: String
    let artworkUrl100: String
    let genres: [Genres]
    let url: String
}

struct Genres: Decodable {
    let name: String
}
