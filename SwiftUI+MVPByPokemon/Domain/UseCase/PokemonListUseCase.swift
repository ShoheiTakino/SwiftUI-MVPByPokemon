//
//  PokemonListUseCase.swift
//  SwiftUI+MVPByPokemon
//
//  Created by 滝野翔平 on 2023/03/12.
//

import Foundation

// MARK: - Input

protocol PokemonListUseCaseInput: AnyObject {
   func fetchPokemonListItemRequest(completion: @escaping (Result<Void, Error>) -> Void)
}

// MARK: - Presenter

final class PokemonListUseCase {
   
    private let dataStore: PokemonListDataStoreInput
    
    init(dataStore: PokemonListDataStoreInput) {
        self.dataStore = dataStore
    }
}

// MARK: - PokemonPresenterInput

extension PokemonListUseCase: PokemonListUseCaseInput {
    
    func fetchPokemonListItemRequest(completion: @escaping (Result<Void, Error>) -> Void) {
        dataStore.fetchPokemonListItemRequest { result in
            completion(result)
        }
    }
}
