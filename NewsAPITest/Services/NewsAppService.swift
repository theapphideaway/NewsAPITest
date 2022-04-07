//
//  NewsAppService.swift
//  NewsAPITest
//
//  Created by ian schoenrock on 3/6/22.
//

import Foundation

class NewsAppService {
    func loadData(searchText:String) async -> NewsAPI? {

        let str = searchText
        let replaced = str.replacingOccurrences(of: " ", with: "+")
       
        guard let url = URL(string:"https://newsapi.org/v2/everything?q=\(replaced)&apiKey=030bb4f85ffe40f7abbe7683108f1fcf&pageSize=100") else{
            print("Invalid URL")
            return nil
        }
        do{
            let(data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(NewsAPI.self, from: data){
                return decodedResponse
            }
        }
        catch{
            print("Error")
        }
        return nil
    }
    
    func loadTopHeadlines() async -> NewsAPI? {
        guard let url = URL(string:"https://newsapi.org/v2/top-headlines?country=us&apiKey=030bb4f85ffe40f7abbe7683108f1fcf") else{
            print("Invalid URL")
            return nil
        }
        do{
            let(data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(NewsAPI.self, from: data){
                return decodedResponse
            }
        }
        catch{
            print("Error")
        }
        return nil
    }
}
