//
//  SearchResponse.swift
//  Music Search
//
//  Created by Вячеслав on 03.12.2019.
//  Copyright © 2019 Вячеслав. All rights reserved.
//

import Foundation
import UIKit

struct SearchResponse: Decodable {
    var resultCount: Int
    var results:[Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
}
