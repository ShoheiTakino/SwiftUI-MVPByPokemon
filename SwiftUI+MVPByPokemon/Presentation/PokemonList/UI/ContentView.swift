//
//  ContentView.swift
//  SwiftUI+MVPByPokemon
//
//  Created by 滝野翔平 on 2023/03/12.
//

import SwiftUI

struct ContentView: View {
    // 2列分のGridItem要素を用意する
   let columns = [GridItem(.fixed(150)),GridItem(.fixed(150))]
    
    var body: some View {
        NavigationView {
            ScrollView() {
                LazyVGrid(columns: columns) {
                    ForEach((1...50), id: \.self) { num in
                        NavigationLink(destination: PokemonDetailView(number: num)) {
                            Text("\(num)")
                                .padding()
                                .frame(width:150,height: 150)
                                .background(Color.red)
                                .padding()
                         }
                    }
                    .cornerRadius(150)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}