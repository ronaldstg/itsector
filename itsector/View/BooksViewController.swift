//
//  BooksView.swift
//  itsector
//
//  Created by Ronald de Souza on 27/01/23.
//

import UIKit

class BooksViewController: UIViewController {
    let booksTableView = BooksTableView()
    var booksViewModel = BooksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        booksViewModel.fetchBooks()
    }
    
    private func setupView() {
        booksTableView.viewModel = booksViewModel
        booksTableView.frame = view.bounds
        booksTableView.bookDelegate = self
        view.addSubview(booksTableView)
    }
}

extension BooksViewController: BooksTableViewDelegate {
    func didSelectBook(_ book: Item) {
        let bookDetailsViewController = BookDetailsViewController()
        bookDetailsViewController.book = book
        navigationController?.pushViewController(bookDetailsViewController, animated: true)
    }
}

