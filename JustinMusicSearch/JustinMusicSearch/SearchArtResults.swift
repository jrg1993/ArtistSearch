//
//  SearchArtResults.swift
//  JustinMusicSearch
//
//  Created by Justin Gluck on 10/28/20.
//

class SearchArtResults {
    static let sharedInstance = SearchArtResults()
    var resultsart: Results?
}

struct Results: Decodable {
    var results: [SongsInfo]
}

struct SongsInfo: Decodable {
    var artistName: String
    var trackName: String
    var releaseDate: String
    var primaryGenreName: String
    var trackPrice: Double
}
