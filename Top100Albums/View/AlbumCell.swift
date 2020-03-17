//
//  AlbumCell.swift
//  Top100Albums
//
//  Created by Jose Vargas on 13/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    // MARK: - Properties
    var albumLabel = UILabel()
    var artistLabel = UILabel()
    var thumbImage = UIImageView()
    
    // MARK: - InitMethods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(thumbImage)
        addSubview(albumLabel)
        addSubview(artistLabel)
        configureImageView()
        configureAlbumLabel()
        configureArtistLabel()
        setThumbImageConstraints()
        setAlbumLabelConstraits()
        setArtisLabelConstarint()
    }
    
    func set(album: Album) {
        thumbImage.setCustomImage(album.artworkUrl100)
        albumLabel.text = album.name
        artistLabel.text = album.artistName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ConfigMethods
    func configureImageView() {
        thumbImage.layer.cornerRadius = 10
        thumbImage.clipsToBounds     = true
    }
    
    func configureAlbumLabel() {
        albumLabel.numberOfLines = 0
        albumLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        albumLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureArtistLabel() {
        artistLabel.numberOfLines = 0
        artistLabel.font = UIFont.italicSystemFont(ofSize: 16.0)
        artistLabel.adjustsFontSizeToFitWidth = true
    }
    
    // MARK: - Constraints
    
    func setThumbImageConstraints() {
        thumbImage.translatesAutoresizingMaskIntoConstraints = false
        thumbImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thumbImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        thumbImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        thumbImage.widthAnchor.constraint(equalTo: thumbImage.heightAnchor, multiplier: 1.0).isActive = true
    }
    
    func setAlbumLabelConstraits() {
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.topAnchor.constraint(equalTo: thumbImage.topAnchor).isActive = true
        albumLabel.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 20).isActive = true
        albumLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        albumLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setArtisLabelConstarint() {
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 20).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        artistLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        artistLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor).isActive = true
    }
}
