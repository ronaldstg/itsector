//
//  BookCell.swift
//  itsector
//
//  Created by Ronald de Souza on 27/01/23.
//

import UIKit

class BookCell: UITableViewCell {
    static let reuseIdentifier = "BookCell"
    let titleLabel = UILabel()
    let thumbnailImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        thumbnailImageView.contentMode = .scaleAspectFit
        titleLabel.numberOfLines = 0
        let stackView = UIStackView(arrangedSubviews: [thumbnailImageView, titleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configure(with item: Item) {
        titleLabel.text = item.volumeInfo.title
        if let thumbURL = item.volumeInfo.imageLinks?.thumbnail {
            print(thumbURL)
            thumbnailImageView.loadImage(from: thumbURL)
        }
    }
}
