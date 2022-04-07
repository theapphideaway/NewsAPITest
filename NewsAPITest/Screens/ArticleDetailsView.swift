//
//  ArticleDetailsView.swift
//  NewsAPITest
//
//  Created by ian schoenrock on 3/10/22.
//

import SwiftUI
import WebKit

struct ArticleDetailsView: View {
    var url: String
    var body: some View {
        NavigationView{
            NewsWebView(url: URL(string: url)!)
        }.navigationBarHidden(true)
    }
}

