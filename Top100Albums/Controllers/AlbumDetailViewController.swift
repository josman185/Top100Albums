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
    var albumViewModel: AlbumViewModel?
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAlbumDetail()
        iTunesButtonAction()
    }
    
    // MARK: - SetDetailData
    func setAlbumDetail() {
        self.title = albumViewModel?.artistName
        self.view = AlbumDetail(frame: UIScreen.main.bounds)
        detailView?.set(detail: albumViewModel)
    }
    
    // MARK: - Actions
    func iTunesButtonAction() {
        #if targetEnvironment(simulator)
            self.showAlert(title: "We Apologize", message: "Use a device to enjoy all features.", style: .cancel)
        #else
            detailView?.iTunesButtonAction = { [weak self] in
                guard let albumUrl = self?.albumViewModel?.url else { return }
                if let url = URL(string: albumUrl) {
                    UIApplication.shared.open(url)
                }
            }
        #endif
    }
}
