//
//  BooksViewModel.swift
//  itsector
//
//  Created by Ronald de Souza on 27/01/23.
//

import Foundation

protocol BooksViewModelDelegate: AnyObject {
    func didFetchBooks()
}

class BooksViewModel {
    
    weak var delegate: BooksViewModelDelegate?
    var books: [Item] = []
    let client = HTTPClient()
    
    func fetchBooks() {
        client.getBooks(query: "ios", completion: { (result) in
            
            switch result {
            case .success(let dataResponse):
                self.books = dataResponse.items
                self.delegate?.didFetchBooks()
                
            case .failure( _):
                print("")
                
            }
        })
    }

    
    var title: String {
//        return books.first?.volumeInfo.title ?? ""
        return "TESTE"
    }
    
    var thumbnailURL: URL? {
        guard let urlString = books.first?.volumeInfo.imageLinks?.thumbnail else {
            return nil
        }
        
        return URL(string: urlString)
    }
}
