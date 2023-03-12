//
//  PokemonListDataStore.swift
//  SwiftUI+MVPByPokemon
//
//  Created by 滝野翔平 on 2023/03/12.
//

import Foundation

// MARK: - Input

protocol PokemonListDataStoreInput: AnyObject {
    func fetchPokemonListItemRequest(completion: @escaping (Result<Void, Error>) -> Void)
}

final class PokemonListDataStore: PokemonListDataStoreInput {
    
    func fetchPokemonListItemRequest(completion: @escaping (Result<Void, Error>) -> Void) {
        
    }
}
