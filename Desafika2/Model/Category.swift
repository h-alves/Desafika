//
//  Category.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import Foundation

struct Category {
    let title: String
    let symbol: String
    
    static var house = Category(title: "Casa", symbol: "house.fill")
    static var park = Category(title: "Parque", symbol: "tree.fill")
    static var museum = Category(title: "Museu", symbol: "building.columns.fill")
    static var restaurant = Category(title: "Restaurante", symbol: "fork.knife")
    static var ambient = Category(title: "Ambiente Público", symbol: "building.2.fill")
    static var movie = Category(title: "Cinema", symbol: "popcorn.fill")
}
