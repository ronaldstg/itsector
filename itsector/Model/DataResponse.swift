//
//  DataResponse.swift
//  itsector
//
//  Created by Ronald de Souza on 27/01/23.
//

import Foundation

struct DataResponse: Codable {
    let kind: String
    let totalItems: Int
    let items: [Item]

    struct Item: Codable {
        let id: String
        let volumeInfo: VolumeInfo

        struct VolumeInfo: Codable {
            let title: String
            let authors: [String]?
            let publisher: String?
            let publishedDate: String?
            let description: String?
            let industryIdentifiers: [IndustryIdentifier]?
            let pageCount: Int?
            let dimensions: Dimensions?
            let printType: String?
            let mainCategory: String?
            let categories: [String]?
            let averageRating: Double?
            let ratingsCount: Int?
            let maturityRating: String?
            let allowAnonLogging: Bool?
            let contentVersion: String?
            let imageLinks: ImageLinks?
            let language: String?
            let previewLink: String?
            let infoLink: String?
            let canonicalVolumeLink: String?
        }
        struct IndustryIdentifier: Codable {
            let type: String
            let identifier: String
        }
        struct Dimensions: Codable {
            let height: String
            let width: String
            let thickness: String
        }
        struct ImageLinks: Codable {
            let smallThumbnail: String?
            let thumbnail: String?
        }
    }
}
