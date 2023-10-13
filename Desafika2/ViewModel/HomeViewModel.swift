//
//  ViewModel.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var list: [Category] = CategoryDataModel.shared.list
    
    func updateList() {
        list = CategoryDataModel.shared.list
    }
    
    func selectCategory(category: Category) {
        let index = CategoryDataModel.shared.list.firstIndex { c in
            return c.title == category.title
        }
        
        CategoryDataModel.shared.list[index!].isSelected.toggle()
        updateList()
    }
    
}
