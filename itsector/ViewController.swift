//
//  ViewController.swift
//  itsector
//
//  Created by Ronald de Souza on 27/01/23.
//

import UIKit

class BooksViewController: UIViewController {
    let booksTableView = BooksTableView()
    var booksViewModel = BooksViewModel()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        booksTableView.backgroundColor = UIColor.red
//        view.addSubview(booksTableView)
//
//        booksTableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            booksTableView.topAnchor.constraint(equalTo: view.topAnchor),
//            booksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            booksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            booksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//
//        booksViewModel.fetchBooks()
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        booksViewModel.fetchBooks()
    }
    
    private func setupView() {
        booksTableView.viewModel = booksViewModel
        booksTableView.frame = view.bounds
        view.addSubview(booksTableView)
    }
}

