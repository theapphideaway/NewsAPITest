//
//  HomePageView.swift
//  NewsAPITest
//
//  Created by ian schoenrock on 3/10/22.
//

import SwiftUI

struct HomePageView: View {
    @State private var result: NewsAPI? = nil
    @State private var searchText = ""
    private var service = NewsAppService()
    var body: some View {
        VStack {
        ScrollView{
            VStack{
                LazyVStack {
                    if(result != nil){
                        ForEach(0...result!.articles!.count - 1, id: \.self){ index in
                            NavigationLink(destination: ArticleDetailsView(url: result!.articles![index].url!)){
                            VStack(){
                                if(result!.articles![index].urlToImage != nil){
                                AsyncImage(
                                    url: URL(string: result!.articles![index].urlToImage!),
                                    content: { image in
                                        image.resizable()
                                            .frame(maxWidth: .infinity, maxHeight: 175)
                                            .cornerRadius(25)
                                            .padding(.horizontal)
                                        
                                    },
                                    placeholder: {
                                        ProgressView().frame(maxWidth: 375, maxHeight: 175)
                                        
                                    }
                                )
                                }
                                Text(result!.articles![index].source!.name!)
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                                Text(result!.articles![index].title!)
                                    .font(.headline)
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            }
                            }
                        }
                    }
                    
                }
            }.task{
                result = await service.loadTopHeadlines()
            }
            
        }
            
        }.background(.gray)
            .frame(maxWidth : .infinity , maxHeight : .infinity)
        
    
    }
    
}



struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
