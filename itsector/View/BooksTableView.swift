//
//  BooksTableView.swift
//  itsector
//
//  Created by Ronald de Souza on 27/01/23.
//

import Foundation
import UIKit

protocol BooksTableViewDelegate: AnyObject {
    func didSelectBook(_ book: Item)
}

class BooksTableView: UITableView {
    
    weak var bookDelegate: BooksTableViewDelegate?
    
    var viewModel: BooksViewModel! {
        didSet {
            self.viewModel.delegate = self
            setupView()
        }
    }
    
    private func setupView() {
        self.dataSource = self
        self.delegate = self
        self.register(BookCell.self, forCellReuseIdentifier: BookCell.reuseIdentifier)
        self.allowsSelection = true
        self.isUserInteractionEnabled = true

    }
}

extension BooksTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: BookCell.reuseIdentifier, for: indexPath) as! BookCell
        let book = viewModel.getBookForIndex(indexPath.row)
        
        cell.configure(with: book)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let bookDelegate = bookDelegate else { return }
        let selectedBook = viewModel.getBookForIndex(indexPath.row)
        bookDelegate.didSelectBook(selectedBook)
    }
}

extension BooksTableView: BooksViewModelDelegate {
    func didFetchBooks() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}


