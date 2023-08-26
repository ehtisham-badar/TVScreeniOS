//
//  MovieViewModel.swift
//  TVScreeniOS
//
//  Created by Ehtisham Badar on 26/08/2023.
//

import Foundation

class MovieViewModel {
    var movieData: Movie?
    
    func loadMovieData(onCompletion: @escaping (Bool) -> Void) {
        if let path = Bundle.main.path(forResource: "MovieJsonFile", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                self.movieData = try decoder.decode(Movie.self, from: data)
                onCompletion(true)
            } catch {
                print("Error loading JSON: \(error)")
                onCompletion(false)
            }
        }
    }
}
