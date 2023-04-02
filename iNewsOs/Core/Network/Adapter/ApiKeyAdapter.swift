//
//  ApiKeyAdapter.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 31/03/23.
//

import Foundation
import Alamofire

class ApiKeyAdapter: RequestAdapter {
    
    private let apiKey: String
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Alamofire.Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        var urlRequest = urlRequest
        
        if let url = urlRequest.url,
           var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false){
            urlComponents.queryItems  = (urlComponents.queryItems ?? []) + [URLQueryItem(name: "apiKey", value: apiKey)]
            urlRequest.url = urlComponents.url
        }
        
        completion(.success(urlRequest))
    }
    
}
