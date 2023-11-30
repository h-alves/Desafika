//
//  Category.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import Foundation

struct Category: Equatable {
    let title: String
    let symbol: String
    var mapsPlaceType: String = ""
    var isSelected: Bool = false
    
    static var house = Category(title: "Casa", symbol: "house.fill", isSelected: true)
    static var park = Category(title: "Parque", symbol: "tree.fill", mapsPlaceType: "park")
    static var ambient = Category(title: "Ambiente Público", symbol: "building.2.fill", mapsPlaceType: "shopping_mall")
    static var movie = Category(title: "Cinema", symbol: "popcorn.fill", mapsPlaceType: "movie_theater")
    static var restaurant = Category(title: "Restaurante", symbol: "fork.knife", mapsPlaceType: "restaurant")
    static var museum = Category(title: "Museu", symbol: "building.columns.fill", mapsPlaceType: "museum")
    
    static var all = Category(title: "Todos", symbol: "")
}

extension Category: Codable {
    
}
