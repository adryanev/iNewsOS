//
//  Article.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 26/03/23.
//

import Foundation

struct Article: Equatable, Hashable, Identifiable {
    let id: UUID
    let source: Source?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
}


extension Article{
    func with(
        id: UUID?? = nil,
        source: Source?? = nil,
        author: String?? = nil,
        title: String?? = nil,
        description: String?? = nil,
        url: String?? = nil,
        urlToImage: String?? = nil,
        publishedAt: Date?? = nil,
        content: String?? = nil
    ) -> Article {
        return Article(
            id: (id ?? self.id) ?? UUID(),
            source: source ?? self.source,
            author: author ?? self.author,
            title: title ?? self.title,
            description: description ?? self.description,
            url: url ?? self.url,
            urlToImage: urlToImage ?? self.urlToImage,
            publishedAt: publishedAt ?? self.publishedAt,
            content: content ?? self.content)
    }
}
