//
//  NewsDetailPage.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 02/04/23.
//

import SwiftUI

struct NewsDetailPage: View {
    let article: Article
    var body: some View {
            VStack(alignment: .leading, spacing: 24) {
                if article.urlToImage != nil {
                    AsyncImage(url: URL(string: article.urlToImage!)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    } placeholder: {
                        ProgressView()
                    }
                }
                VStack(spacing: 16) {
                    Text(article.title ?? "")
                        .font(.headline)
                    HStack {
                        Text(article.author ?? "")
                            .bold()
                        Text(article.publishedAt?.formatted(date: .abbreviated, time: .omitted) ?? "")
                    }
                   
                    Text(article.content ?? "")
                        .padding(.bottom, 16)
                    
                    NavigationLink(destination: WebViewPage(url: article.url!)){
                        Text("Read more")
                            .frame(width: 150, height: 50, alignment: .center)
                            .background(.blue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.horizontal, 8)
                
            }.ignoresSafeArea()
    }
}

struct NewsDetailPage_Previews: PreviewProvider {
    
    static var previews: some View {
        let article = Article(id: UUID(), source: Source(id: "engadget", name: "Endgadget"), author: "Jeff Dunn", title: "Apple's AirPods Pro drop back to $200, plus the rest of the week's best tech deals", description: "It's Friday, which means it's time for another roundup of notable discounts on good tech. Among the highlights, Apple's AirPods Pro are back down to $200, tying the best price we've seen for the iPhone-friendly noise-cancelling earphones. Amazon has dropped t…", url: "https://www.engadget.com/apples-airpods-pro-drop-back-to-200-best-tech-deals-this-week-154133672.html", urlToImage: "https://s.yimg.com/uu/api/res/1.2/BAMvC3_.5TRpMJE4CGUJzA--~B/Zmk9ZmlsbDtoPTYzMDtweW9mZj0wO3c9MTIwMDthcHBpZD15dGFjaHlvbg--/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2022-09/9bd30380-39fd-11ed-9daf-94386034b5b5.cf.jpg", publishedAt:Date.now, content: "All products recommended by Engadget are selected by our editorial team, independent of our parent company. Some of our stories include affiliate links. If you buy something through one of these link… [+11983 chars]")
        NewsDetailPage(article: article)
    }
}
