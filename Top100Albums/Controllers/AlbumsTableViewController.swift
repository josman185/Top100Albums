//
//  AlbumsTableViewController.swift
//  Top100Albums
//
//  Created by Jose Vargas on 13/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UIViewController {
    
    struct AlbumsConstants {
        static let albumCell = "albumCell"
    }
    
    // MARK: - Properties
    var albumsTableView = UITableView()
    var albums: [Album] = []
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Albums"
        configureTableView()
        fetchAlbums()
    }
    
    // MARK: - TableViewConfig
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
    
    // MARK: - Actions
    func fetchAlbums() {
        CustomActivityIndicator.start()
        NetworkingManager.shared.fetchAlbums { (result: Result<[Album], NetworkingManager.APIServiceError>) in
            switch result {
            case .success(let feed):
                self.albums = feed
                DispatchQueue.main.async {
                    self.albumsTableView.reloadData()
                    CustomActivityIndicator.stop()
                }
            case .failure(let error):
                print(error.localizedDescription)
                CustomActivityIndicator.stop()
            }
        }
    }
    
    func showAlbumDetailView(_ album: Album) {
        let detailVC = AlbumDetailViewController()
        detailVC.album = album
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - TableViewDelegate
extension AlbumsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumsConstants.albumCell) as? AlbumCell else { return UITableViewCell() }
        cell.album = albums[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = self.albums[indexPath.row]
        showAlbumDetailView(album)
    }
}
