//
//  AlbumViewModel.swift
//  Top100Albums
//
//  Created by Jose Vargas on 24/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import Foundation

struct AlbumViewModel {
    
    let artistName: String
    let releaseDate: String
    let name: String
    let copyright: String
    let artworkUrl100: String
    let genres: [Genres]
    let url: String
    
    init(album: Album) {
        self.artistName = album.artistName
        self.releaseDate = album.releaseDate
        self.name = album.name
        self.copyright = album.copyright
        self.artworkUrl100 = album.artworkUrl100
        self.genres = album.genres
        self.url = album.url
    }
}
