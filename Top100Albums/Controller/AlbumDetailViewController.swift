//
//  AlbumDetailViewController.swift
//  Top100Albums
//
//  Created by Jose Vargas on 14/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    // MARK: - Properties
    var detailView: AlbumDetail? { return view as? AlbumDetail }
    var album: Album?
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAlbumDetail()
        iTunesButtonAction()
    }
    
    // MARK: - SetDetailData
    func setAlbumDetail() {
        self.title = album?.artistName
        self.view = AlbumDetail(frame: UIScreen.main.bounds)
        detailView?.set(detail: album)
    }
    
    // MARK: - Actions
    func iTunesButtonAction() {
        #if targetEnvironment(simulator)
            self.showAlert(titleStr: "We Apologize", messageStr: "Use a device to enjoy all features.", style: .cancel)
        #else
            detailView?.iTunesButtonAction = { [weak self] in
                guard let albumUrl = self?.album?.url else { return }
                if let url = URL(string: albumUrl) {
                    UIApplication.shared.open(url)
                }
            }
        #endif
    }
}
