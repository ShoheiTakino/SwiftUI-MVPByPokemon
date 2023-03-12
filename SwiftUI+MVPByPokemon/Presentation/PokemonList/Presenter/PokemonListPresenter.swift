//
//  PokemonListPresenter.swift
//  SwiftUI+MVPByPokemon
//
//  Created by 滝野翔平 on 2023/03/12.
//

import Foundation

// MARK: - Input

protocol PokemonListPresenterInput: AnyObject {
    func viewDidLoad()
    func didSelected(item: Pokemon)
}

// MARK: - Output

protocol PokemonListPresenterOutput: AnyObject {
    func showPokemon(list: [Pokemon])
    func presentSelectedPokemonDetailVC(item: Pokemon)
}

// MARK: - Presenter

final class PokemonListPresenter {
    
    private weak var view: PokemonListPresenterOutput?
    private let useCase: PokemonListUseCaseInput
    
    init(view: PokemonListPresenterOutput, useCase: PokemonListUseCaseInput) {
        self.view = view
        self.useCase = useCase
    }
}

// MARK: - PokemonPresenterInput

extension PokemonListPresenter: PokemonListPresenterInput {
    
    func viewDidLoad() {
        useCase.fetchPokemonListItemRequest { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let data):
                strongSelf.view?.showPokemon(list: data)
            case .failure:
                break
            }
        }
        // TODO: 後ほどリクエストとつなぐ
//        view?.showPokemon(list: [Pokemon])
    }
    
    func didSelected(item: Pokemon) {
        view?.presentSelectedPokemonDetailVC(item: item)
    }
}
