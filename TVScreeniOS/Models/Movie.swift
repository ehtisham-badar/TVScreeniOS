//
//  Movie.swift
//  TVScreeniOS
//
//  Created by Ehtisham Badar on 26/08/2023.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let movieList: [String]
    let sections: [Section]
}

// MARK: - Section
struct Section: Codable {
    let sectionHeading: String
    let movies: [String]
}
