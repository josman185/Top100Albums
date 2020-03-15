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
        addSubview(albumImage)
        addSubview(copyrightLabel)
        setCopyrightLabelConstraints()
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
    
    func setAlbumImageViewConstrainst() {
        albumImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setCopyrightLabelConstraints() {
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        copyrightLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
