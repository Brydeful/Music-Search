//
//  MusicTableViewController.swift
//  Music Search
//
//  Created by Вячеслав on 03.12.2019.
//  Copyright © 2019 Вячеслав. All rights reserved.
//

import UIKit
import Alamofire

class MusicTableViewController: UITableViewController {
    
    let networkService = NetworkService()
    let searchController = UISearchController()
    var tracks = [Track]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar(){
        navigationItem.title = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    private func setupTableView(){
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TrackCell else { return UITableViewCell()}
        let track = tracks[indexPath.row]
        cell.track = track
        return cell
    }
}

// MARK: - UISearchBarDelegate

extension MusicTableViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        networkService.fetchTracks(seacrhString: searchText) { [weak self] (searchResponse) in
            guard let searchResponse = searchResponse else {return}
            self?.tracks = searchResponse.results
            self?.tableView.reloadData()
        }
    }
}
