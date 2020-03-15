//
//  AlbumDetailVC.swift
//  Top100Albums
//
//  Created by Jose Vargas on 14/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

class AlbumDetailVC: UIViewController {
    
    var detailView: AlbumDetail { return self.view as! AlbumDetail }
    var album: Album?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        view.backgroundColor = .green
    }
    
    override func loadView() {
        self.view = AlbumDetail(frame: UIScreen.main.bounds)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
