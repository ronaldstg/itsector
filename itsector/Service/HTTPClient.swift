//
//  HTTPClient.swift
//  itsector
//
//  Created by Ronald de Souza on 27/01/23.
//

import Foundation

enum APIError: Error {
    case noData
}

class HTTPClient {
    func getBooks(query: String, completion: @escaping (Result<DataResponse, Error>) -> Void) {
        let url = "https://www.googleapis.com/books/v1/volumes?q=\(query)&maxResults=20&startIndex=0"
        let request = URLRequest(url: URL(string: url)!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
           
            guard let data = data, error == nil else {
               return completion(.failure(APIError.noData))
            }
            
            guard let dataResponse = try? JSONDecoder().decode(DataResponse.self, from: data) else {
                return completion(.failure(APIError.noData))
            }
            
            completion(.success(dataResponse))
            
        }.resume()
    }
}
