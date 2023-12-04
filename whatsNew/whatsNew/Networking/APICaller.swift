//
//  APICaller.swift
//  whatsNew
//
//  Created by Mohammed Saqib on 29/11/23.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies(
        completionHandler: @escaping (_ result: Result<TrendingMovieModel, NetworkError>)
    -> Void ) {
        let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
               let data = dataResponse,
               let resultData = try?
                JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            }
            else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
