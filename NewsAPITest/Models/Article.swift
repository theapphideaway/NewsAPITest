//
//  Article.swift
//  NewsAPITest
//
//  Created by ian schoenrock on 3/6/22.
//

import Foundation

struct Article: Codable {
    let source: Source?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
}

