//
//  AlbumsTableViewController.swift
//  Top100Albums
//
//  Created by Jose Vargas on 13/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

struct AlbumsConstants {
    static let albumCell = "albumCell"
}

class AlbumsTableViewController: UIViewController {
    
    var albumsTableView = UITableView()
    var albums: [Album] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Albums"
        configureTableView()
        CustomActivityIndicator.start()
        fetchAlbums()
    }
    
    func configureTableView() {
        view.addSubview(albumsTableView)
        setTableViewDelegates()
        albumsTableView.rowHeight = 120
        albumsTableView.register(AlbumCell.self, forCellReuseIdentifier: AlbumsConstants.albumCell)
        albumsTableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        albumsTableView.delegate = self
        albumsTableView.dataSource = self
    }
    
    func fetchAlbums() {
        NetworkingManager.shared.fetchAlbums { (result:Result<[Album], NetworkingManager.APIServiceError>) in
            switch result {
            case .success(let feed):
                self.albums = feed
                DispatchQueue.main.async {
                    self.albumsTableView.reloadData()
                    CustomActivityIndicator.stop()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension AlbumsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumsConstants.albumCell) as? AlbumCell else { return UITableViewCell() }
        let album = albums[indexPath.row]
        cell.set(album: album)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = self.albums[indexPath.row]
        let detailVC = AlbumDetailViewController()
        detailVC.album = album
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
