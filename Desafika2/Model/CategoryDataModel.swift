//
//  CategoryDataModel.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import Foundation

class CategoryDataModel {
    static let shared = CategoryDataModel()
    
    var list: [Category] = [
        Category.house,
        Category.park,
        Category.museum,
        Category.movie,
        Category.ambient,
        Category.restaurant
    ]
}
