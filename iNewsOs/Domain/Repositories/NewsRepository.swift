//
//  NewsRepository.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 01/04/23.
//

import Foundation
import Combine

protocol NewsRepository {
    
    func getTrendingArticles() -> AnyPublisher<[Article], Failure>
}
