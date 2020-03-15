//
//  AlbumDetail.swift
//  Top100Albums
//
//  Created by Jose Vargas on 14/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

class AlbumDetail: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(albumImage)
        self.addSubview(copyrightLabel)
        self.setAlbumImageViewConstrainst()
        self.setCopyrightLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let albumImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.gray.cgColor
        return imageView
    }()
    
    let copyrightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        label.numberOfLines = 0
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    func set(detail: Album) {
        //thumbImage.setCustomImage(album.artworkUrl100)
        albumImage.setCustomImage(detail.artworkUrl100)
        copyrightLabel.text = detail.copyright
        //artistLabel.text = album.artistName
    }
    
    func setAlbumImageViewConstrainst() {
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        albumImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        albumImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        albumImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        albumImage.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    func setCopyrightLabelConstraints() {
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightLabel.leftAnchor.constraint(equalTo: self.albumImage.leftAnchor, constant: 0).isActive = true
        copyrightLabel.rightAnchor.constraint(equalTo: self.albumImage.rightAnchor, constant: 0).isActive = true
        copyrightLabel.topAnchor.constraint(equalTo: self.albumImage.bottomAnchor, constant: 10).isActive = true
        //copyrightLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        //copyrightLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
