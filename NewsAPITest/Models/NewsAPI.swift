//
//  Response.swift
//  NewsAPITest
//
//  Created by ian schoenrock on 3/6/22.
//

import Foundation

struct NewsAPI: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

