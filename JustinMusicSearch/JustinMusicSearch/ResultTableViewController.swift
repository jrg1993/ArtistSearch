//
//  ResultsTbaleViewControllerTableViewController.swift
//  JustinMusicSearch
//
//  Created by Justin Gluck on 10/28/20.
//

import UIKit

class MyCustomCell: UITableViewCell {
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var genre: UILabel!
    
    @IBOutlet weak var price: UILabel!
}

class ResultTableViewController: UITableViewController {
    var results: Results?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        results = SearchArtResults.sharedInstance.resultsart
        let topIndex = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: topIndex, at: .top, animated: true)
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = results?.results.count else { return 1}
        return rows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "track", for: indexPath) as! MyCustomCell
        
        cell.artistName.text = "Artist:  \(results?.results[indexPath.row].artistName ?? "")"
        cell.trackName.text = "Track:  \(results?.results[indexPath.row].trackName ?? "")"
        cell.date.text = "Release Date:  \(results?.results[indexPath.row].releaseDate ?? "")"
        cell.date.text = "Release Date:  \(results?.results[indexPath.row].releaseDate ?? "")"
        cell.genre.text = "Genre::  \(results?.results[indexPath.row].releaseDate ?? "")"
        cell.price.text = "Price:  \(results?.results[indexPath.row].trackPrice ?? 0.00)"

        return cell
    }
}
