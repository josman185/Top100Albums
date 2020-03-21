//
//  ImageViewExtension.swift
//  Top100Albums
//
//  Created by Jose Vargas on 14/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImage(_ url: String?) {
        if let url = url {
            guard let url = URL(string: url) else { return }
            DispatchQueue.global().async { [weak self] in
                if let imgData = try? Data(contentsOf: url) {
                    if let image = UIImage(data: imgData) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        } else {
            self.image = UIImage(named: "Apple")
        }
    }
}
