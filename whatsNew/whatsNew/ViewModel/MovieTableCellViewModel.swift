//
//  MovieTableCellViewModel.swift
//  whatsNew
//
//  Created by Mohammed Saqib on 04/12/23.
//

import Foundation

class MovieTableCellViewModel {
    
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageURl: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.name ?? movie.title ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = "\(movie.voteAverage)/10"
        self.imageURl = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
