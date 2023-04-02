//
//  InjectionContainer.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 26/03/23.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import Alamofire
import SwiftUI

final class InjectionContainer {
    
    static let shared = InjectionContainer()
    private var _container: Container?
    
    var container: Container {
        get {
            if _container == nil {
                _container = buildContainer()
            }
            return _container!
        }
        set {
            _container = newValue
        }
    }
    
    private func buildContainer() -> Container {
        let container = Container()
        //register component here
        container.register(ApiKeyAdapter.self){ _ in
            let apiKey = "MY_API_KEY"
            return ApiKeyAdapter(apiKey: apiKey)
        }
        container.register(Session.self) { resolver in
            let configuration = URLSessionConfiguration.af.default
            let apiKeyAdapter = resolver.resolve(ApiKeyAdapter.self)!
            let interceptor = Interceptor(adapters: [apiKeyAdapter])
            return Session(configuration: configuration, interceptor: interceptor)
        }
        container.register(NewsRemoteDataSource.self) { resolver in
            let session = resolver.resolve(Session.self)!
            let decoder = newJSONDecoder()
            return NewsRemoteDataSourceImpl(session: session, decoder: decoder)
        }
        container.register(NewsRepository.self) { resolver in
            let datasource = resolver.resolve(NewsRemoteDataSource.self)!
            return NewsRepositoryImpl(remoteSource: datasource)
            
        }
        container.register(AnyUseCase<[Article], NoParams>.self, name: "GetTrendingArticle") { resolver in
            let repository = resolver.resolve(NewsRepository.self)!
            let usecase = GetTrendingArticleImpl(repository: repository)
            return AnyUseCase<[Article], NoParams>(useCase: usecase)
        }
        
        container.register(NewsViewModel.self) { resolver in
            let usecase = resolver.resolve(AnyUseCase<[Article], NoParams>.self, name: "GetTrendingArticle")!
            return NewsViewModel(getTrendingNews: usecase)
            
        }
        
        
        return container;
    }
    
}

@propertyWrapper
struct Injected<Service> {
    private var service: Service
    
    public init() {
        self.service = InjectionContainer.shared.container.resolve(Service.self)!
    }
    public var wrappedValue: Service {
        get { return service }
        mutating set { service = newValue }
    }
}

@propertyWrapper
struct InjectedObject<Service>: DynamicProperty where Service: ObservableObject {
    @ObservedObject private var service: Service
    
    public init() {
        self.service = InjectionContainer.shared.container.resolve(Service.self)!
    }
    
    public init(name: String? = nil, container: Resolver? = nil) {
        self.service = InjectionContainer.shared.container.resolve(Service.self, name: name) ??
        InjectionContainer.shared.container.resolve(Service.self, name: name)!
    }
    
    public var wrappedValue: Service {
        get { return service }
        mutating set { service = newValue }
    }
    
    public var projectedValue: ObservedObject<Service>.Wrapper {
        return self.$service
    }
    
}
