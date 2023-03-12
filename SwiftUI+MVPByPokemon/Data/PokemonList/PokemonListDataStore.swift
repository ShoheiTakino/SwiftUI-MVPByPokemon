//
//  PokemonListDataStore.swift
//  SwiftUI+MVPByPokemon
//
//  Created by 滝野翔平 on 2023/03/12.
//

import Foundation

// MARK: - Input

protocol PokemonListDataStoreInput: AnyObject {
    func fetchPokemonListItemRequest(completion: @escaping (Result<[Pokemon], Error>) -> Void)
}

final class PokemonListDataStore: PokemonListDataStoreInput {
    
    func fetchPokemonListItemRequest(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        let url = "https://pokeapi.co/api/v2/"
    }
}
