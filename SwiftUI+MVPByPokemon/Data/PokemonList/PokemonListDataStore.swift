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
    var items: [Pokemon] = []

    func fetchPokemonListItemRequest(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        let url: URL = URL(string: "https://pokeapi.co/api/v2/ability/")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let pokemon = try decoder.decode([Pokemon].self, from: data)
                for i in 0..<200 {
                    DispatchQueue.main.async {
                        self.items.append(pokemon[i])
                    }
                }

            } catch {
                print("FAILED DECODER:", error.localizedDescription)
            }
        }.resume()
    }
    
}
