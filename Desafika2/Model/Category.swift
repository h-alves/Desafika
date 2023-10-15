//
//  Category.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import Foundation

struct Category: Equatable {
    let title: String
    let symbol: String
    var isSelected: Bool
    
    static var house = Category(title: "Casa", symbol: "house.fill", isSelected: false)
    static var park = Category(title: "Parque", symbol: "tree.fill", isSelected: false)
    static var museum = Category(title: "Museu", symbol: "building.columns.fill", isSelected: false)
    static var restaurant = Category(title: "Restaurante", symbol: "fork.knife", isSelected: false)
    static var ambient = Category(title: "Ambiente Público", symbol: "building.2.fill", isSelected: false)
    static var movie = Category(title: "Cinema", symbol: "popcorn.fill", isSelected: false)
    
    static var all = Category(title: "Todos", symbol: "", isSelected: false)
}
