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
        // TODO: 後ほどリクエストとつなぐ
//        view?.showPokemon(list: [Pokemon])
    }
    
    func didSelected(item: Pokemon) {
        view?.presentSelectedPokemonDetailVC(item: item)
    }
}
