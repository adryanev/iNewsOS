//
//  NewsRemoteDataSource.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 01/04/23.
//

import Foundation
import Combine
import Alamofire

protocol NewsRemoteDataSource {
    
    func getTrendingNews() -> AnyPublisher<NewsResult, Failure>
}

class NewsRemoteDataSourceImpl: NewsRemoteDataSource {
    private let alamofire: Session
    private let decoder: JSONDecoder
    
    public init(session: Session, decoder: JSONDecoder){
        self.alamofire = session
        self.decoder = decoder
    }
    
    func getTrendingNews() -> AnyPublisher<NewsResult, Failure> {
        let parameters: [String: Any] = [
            "language": "en",
            "q": "apple",
            "from": "2023-04-01",
            "sortBy": "popularity",
        ]
        
        return self.alamofire
            .request(ApiEndpoint.everything.rawValue, parameters: parameters)
            .validate()
            .publishDecodable(type: NewsResult.self, decoder: self.decoder)
            .value()
            .mapError{ error in
                debugPrint(error)
                return Failure.remoteFailure(reason: error.localizedDescription)}
            .eraseToAnyPublisher()
    }
    
    
}
