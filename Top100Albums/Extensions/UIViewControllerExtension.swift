//
//  UIViewControllerExtension.swift
//  Top100Albums
//
//  Created by Jose Vargas on 17/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(titleStr:String, messageStr:String, style: UIAlertAction.Style) {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
