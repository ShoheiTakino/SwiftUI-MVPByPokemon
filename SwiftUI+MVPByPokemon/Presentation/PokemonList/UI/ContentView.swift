//
//  ContentView.swift
//  SwiftUI+MVPByPokemon
//
//  Created by 滝野翔平 on 2023/03/12.
//

import SwiftUI
import Combine


struct Movie: Codable, Identifiable {
    public var id: Int
    public var name: String
    public var released: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "title"
        case released = "year"
    }
}

public class MovieFetcher: ObservableObject {
    @Published var movies = [Movie]()
    
    init() {
        load()
    }
    
    func load() {
        guard let url = URL(string: "https://gist.githubusercontent.com/rbreve/60eb5f6fe49d5f019d0c39d71cb8388d/raw/f6bc27e3e637257e2f75c278520709dd20b1e089/movies.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                self.movies = try! JSONDecoder().decode([Movie].self, from: data!)
            }
        }.resume()
    }
}


struct ContentView: View {
    @ObservedObject var fetcher = MovieFetcher()
    
    var body: some View {
        VStack {
            List(fetcher.movies) { movie in
                VStack (alignment: .leading) {
                    Text(movie.name)
                    Text(movie.released)
                        .font(.system(size: 11))
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}
    // 2列分のGridItem要素を用意する
//   let columns = [GridItem(.fixed(150)),GridItem(.fixed(150))]
//
//    private var presenter: PokemonListPresenterInput?
//    @State private var results = [Pokemon]()
//
//    var body: some View {
//        NavigationStack {
//            ScrollView() {
//                LazyVGrid(columns: columns) {
//                    ForEach((1...50), id: \.self) { num in
//                        NavigationLink(destination: PokemonDetailView(number: num)) {
//                            Text("\(num)")
//                                .padding()
//                                .frame(width:150,height: 150)
//                                .background(Color.red)
//                                .padding()
//                         }
//                    }
//                    .cornerRadius(150)
//                }
//            }
//        }
//    }
    
    
    /// データ読み込み処理
//    func loadData() {
//        // URLの生成
//        guard let url = URL(string: "https://pokeapi.co/api/v2/ability/") else { return }
//        // URLリクエストの生成
//        let request = URLRequest(url: url)
//        // URLにアクセス
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {    // ①データ取得チェック
//                // ②JSON→Responseオブジェクト変換
//                let decoder = JSONDecoder()
//                guard let decodedResponse = try? decoder.decode([Pokemon].self, from: data) else { return }
//                // ③書籍情報をUIに適用
//                DispatchQueue.main.async {
//                    results = decodedResponse
//                }
//            } else {
//                /// ④データが取得できなかった場合の処理
//                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//            }
//        }.resume()      // タスク開始処理（必須）
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
