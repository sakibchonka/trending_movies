//
//  NetworkConstant.swift
//  whatsNew
//
//  Created by Mohammed Saqib on 29/11/23.
//

import Foundation

class NetworkConstant {
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        
    }
    
    public var apiKey: String {
        get {
            //API from https://www.themoviedb.org
            return "6bb5103981650a9c6b89d1b2e6299ba5"
        }
    }
    
    public var serverAddress: String {
        return "https://api.themoviedb.org/3/"
    }
    
    public var imageServerAddress: String {
        return "https://image.tmdb.org/t/p/w500/"
    }
}
