//
//  Results.swift
//  JustinMusicSearch
//
//  Created by Justin Gluck on 10/28/20.
//

import Foundation

class ResultsArt {
    static let sharedInstance = ResultsArt()
    var resultsart: Results?
   
}

struct Results: Decodable {
    var results: [SongsInfo]
}

struct SongsInfo: Decodable {
    var artistName: String
}
