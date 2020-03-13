//
//  ViewController.swift
//  Top100Albums
//
//  Created by Jose Vargas on 13/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController")
        view.backgroundColor = .green
        NetworkingManager.shared.fetchAlbums { (result:Result<[Album], NetworkingManager.APIServiceError>) in
            switch result {
            case .success(let feed):
                print(String("\(feed)"))
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

