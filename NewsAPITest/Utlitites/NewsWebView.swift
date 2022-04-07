//
//  NewsWebView.swift
//  NewsAPITest
//
//  Created by ian schoenrock on 3/10/22.
//


import SwiftUI
import WebKit
 
struct NewsWebView: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
