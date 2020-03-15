//
//  UIImageView_Ext.swift
//  Top100Albums
//
//  Created by Jose Vargas on 14/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setCustomImage(_ imgURLString: String?) {
        if let imageURLString = imgURLString {
            
            guard let url = URL(string: imageURLString) else { return }
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
            task.resume()
        } else {
            self.image = UIImage(named: "Apple")
        }
    }
    
}
