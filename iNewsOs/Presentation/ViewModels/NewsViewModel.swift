//
//  NewsViewModel.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 01/04/23.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    private let getTrendingNews: AnyUseCase<[Article], NoParams>
    private var cancellables: Set<AnyCancellable>
    @Published private(set) var state = NewsState.initial()
    
    init(getTrendingNews: AnyUseCase<[Article], NoParams>){
        self.getTrendingNews = getTrendingNews
        self.cancellables = Set<AnyCancellable>()
    }
    
    func prosess(intent: NewsIntent){
        switch intent {
        case .fetchTrendingNews:
            fetchTrendingNews()
        }
    }
    
    
    private func fetchTrendingNews() {
        state = state.with(status: NewsStatus.loading)
        
        getTrendingNews.execute(params: NoParams())
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    self.state = self.state.with(
                        status: .failed(error)
                    )
                    
                }
            }, receiveValue: { articles in
                self.state = self.state.with(articles: articles, status: NewsStatus.success(articles))
                
            })
            .store(in: &cancellables)
    }
    
}

struct NewsState {
    let articles: [Article]
    let status: NewsStatus
}

extension NewsState {
    static func initial() -> NewsState {
        return NewsState(articles: [], status: NewsStatus.initial)
    }
    func with(
        articles: [Article]?? = nil,
        status: NewsStatus?? = nil
    ) -> NewsState {
        return NewsState(
            articles: (articles ?? self.articles) ?? [],
            status: (status ?? self.status) ?? NewsStatus.initial
        )
    }
}

enum NewsStatus {
    case initial
    case loading
    case success([Article])
    case failed(Failure)
}

enum NewsIntent {
    case fetchTrendingNews
}
