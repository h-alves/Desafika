//
//  CategoryDataSource.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import Foundation

class CategoryDataSource {
    
    static let shared = CategoryDataSource()
    
    var list: [Category] = [
        Category.house,
        Category.park,
        Category.museum,
        Category.movie,
        Category.ambient,
        Category.restaurant
    ]
}
