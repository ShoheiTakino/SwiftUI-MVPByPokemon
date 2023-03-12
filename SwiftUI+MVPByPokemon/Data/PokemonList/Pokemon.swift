//
//  PokemonModel.swift
//  SwiftUI+MVPByPokemon
//
//  Created by 滝野翔平 on 2023/03/12.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
   var id: Int
   var name: String
   var sprites: Sprites
   var typeList: [TypeList]
   struct Sprites: Decodable {
       var frontDefault: String
       private enum CodingKeys: String, CodingKey {
           case frontDefault = "front_default"
       }
   }
   struct TypeList: Decodable {
       var type: Type
       struct `Type`: Decodable {
           var name = "name"
           private enum CodingKeys: String, CodingKey {
               case name = "name"
           }
       }
       private enum CodingKeys: String, CodingKey {
           case type = "type"
       }
   }

   private enum CodingKeys: String, CodingKey {
       case id = "id"
       case name = "name"
       case sprites = "sprites"
       case typeList = "types"
   }
}

struct Models {
   var id: Int
   var name: String
   var image: String
}
