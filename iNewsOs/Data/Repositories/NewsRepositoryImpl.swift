//
//  NewsRepositoryImpl.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 01/04/23.
//

import Foundation
import Combine
class NewsRepositoryImpl: NewsRepository {
    
    private let remoteSource: NewsRemoteDataSource
    
    public init (remoteSource: NewsRemoteDataSource){
        self.remoteSource = remoteSource
    }
    func getTrendingArticles() -> AnyPublisher<[Article], Failure> {
        return remoteSource.getTrendingNews()
            .map({ $0.articles.map( { $0.toArticle() } ) })
            .eraseToAnyPublisher()
    }
    
    
}
