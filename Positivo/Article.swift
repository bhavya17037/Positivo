//
//  Article.swift
//  Positivo
//
//  Created by Bhavya  Srivastava on 02/09/20.
//  Copyright © 2020 Bhavya Srivastava. All rights reserved.
//

import Foundation
import SwiftUI

struct NewsFeed: Codable {
    var status: String? = nil
    var totalResults: Int? = nil
    var articles: [Article]
}

struct Article: Codable {
    let source: ESourceModel?
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

struct ESourceModel: Codable {
    let id: String?
    let name: String?
}
