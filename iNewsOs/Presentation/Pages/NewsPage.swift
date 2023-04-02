//
//  NewsPage.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 02/04/23.
//

import SwiftUI

struct NewsPage: View {
    
    @ObservedObject var viewModel: NewsViewModel
    
    init(viewModel: NewsViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationStack{
            VStack{
                List(viewModel.state.articles, id: \.id) { article in
                    NavigationLink(value: article){
                        VStack(alignment: .leading) {
                            if article.urlToImage != nil {
                                AsyncImage(url: URL(string: article.urlToImage!)) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            Text(article.title ?? "")
                                .font(.headline)
                            Text(article.description ?? "")
                                .font(.subheadline)
                            
                        }
                    }
                    
                }
                
            }
            .navigationTitle("iNewsOS")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: AboutPage()){
                        Image(systemName: "person")
                        
                    }
                }
            }
            .onAppear {
                viewModel.prosess(intent: NewsIntent.fetchTrendingNews)
            }
            .navigationDestination(for: Article.self){ article in
                NewsDetailPage(article: article)
            }
        }
        
        
    }
}

struct NewsPage_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InjectionContainer.shared.container.resolve(NewsViewModel.self)!
        NewsPage(viewModel: viewModel)
    }
}
