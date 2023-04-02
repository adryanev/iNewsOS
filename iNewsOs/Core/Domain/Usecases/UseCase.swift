//
//  UseCase.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 01/04/23.
//

import Foundation
import Combine

protocol UseCaseProtocol {
    associatedtype ReturnType
    associatedtype Params: Equatable
    
    func execute(params: Params) -> AnyPublisher<ReturnType, Failure>
}

struct AnyUseCase<T, P: Equatable>: UseCaseProtocol {
   
    init<U>(useCase: U) where U: UseCaseProtocol, U.ReturnType == T, U.Params == P {
        _execute = useCase.execute
    }
    func execute(params: P) -> AnyPublisher<T, Failure> {
        _execute(params)
    }
    
    let _execute: (P) -> AnyPublisher<T, Failure>
    
    typealias ReturnType = T
    typealias Params = P
    
    
}
struct NoParams: Equatable {}
