//
//  UIImageView+Extensions.swift
//  itsector
//
//  Created by Ronald de Souza on 27/01/23.
//

import UIKit

extension UIImageView {
    func loadImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
        task.resume()
    }
}
