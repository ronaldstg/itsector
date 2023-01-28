//
//  BooksTableView.swift
//  itsector
//
//  Created by Ronald de Souza on 27/01/23.
//

import Foundation
import UIKit

class BooksTableView: UITableView {
    var viewModel: BooksViewModel! {
        didSet {
            self.viewModel.delegate = self
            setupView()
        }
    }
    
    private func setupView() {
        self.dataSource = self
        self.register(BookCell.self, forCellReuseIdentifier: BookCell.reuseIdentifier)
    }
}

extension BooksTableView: UITableViewDataSource {
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return viewModel.books.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = dequeueReusableCell(withIdentifier: BookCell.reuseIdentifier, for: indexPath) as! BookCell
           let book = viewModel.books[indexPath.row]
       
           cell.configure(with: book)
           return cell
       }
}

extension BooksTableView: BooksViewModelDelegate {
    func didFetchBooks() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}


