//
//  BookDetailsViewController.swift
//  itsector
//
//  Created by Ronald de Souza on 27/01/23.
//

import UIKit

class BookDetailsViewController: UIViewController {
    var book: Item?
    
    private let bookTitleLabel = UILabel()
    private let bookCoverImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    private func configureView() {
        view.backgroundColor = UIColor.white
        setupBookCoverImageView()
        setupBookTitleLabel()
    }
    
    private func setupBookCoverImageView() {
        view.addSubview(bookCoverImageView)
        bookCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        bookCoverImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        bookCoverImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        bookCoverImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        bookCoverImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        bookCoverImageView.contentMode = .scaleAspectFit
        
        if let thumbnailURL = book?.volumeInfo.imageLinks?.thumbnail  {
            bookCoverImageView.loadImage(from: thumbnailURL)
        }
    }
    
    private func setupBookTitleLabel() {
        view.addSubview(bookTitleLabel)
        bookTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        bookTitleLabel.topAnchor.constraint(equalTo: bookCoverImageView.topAnchor, constant: 16).isActive = true
        bookTitleLabel.leadingAnchor.constraint(equalTo: bookCoverImageView.trailingAnchor, constant: 16).isActive = true
        bookTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        bookTitleLabel.numberOfLines = 0
        bookTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        bookTitleLabel.text = book?.volumeInfo.title
    }
    
}
