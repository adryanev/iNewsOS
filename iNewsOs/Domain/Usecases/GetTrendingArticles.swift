//
//  GetTrendingArticles.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 01/04/23.
//

import Foundation
import Combine

protocol GetTrendingArticle: UseCaseProtocol{
    associatedtype ReturnType = [Article]
    associatedtype Params = NoParams
}

class GetTrendingArticleImpl : GetTrendingArticle {

    private let repository: NewsRepository
    
    public init (repository: NewsRepository){
        self.repository = repository
    }

    func execute(params: NoParams) -> AnyPublisher<[Article], Failure> {
        return repository.getTrendingArticles()
    }
    
    
}
