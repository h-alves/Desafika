//
//  ViewModel.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var list: [Category] = CategoryDataSource.shared.list
    @Published var buttonActivated: Bool = false
    
    init() {
        _ = LocationService.shared.getLocationManager()
    }
    
    func updateList() {
        list = CategoryDataSource.shared.list
    }
    
    func selectCategory(category: Category) {
        let index = CategoryDataSource.shared.list.firstIndex { c in
            return c.title == category.title
        }
        
        CategoryDataSource.shared.list[index!].isSelected.toggle()
        
        updateList()
        toggleButton()
        
        if allClicked() {
            Category.all.isSelected = true
        } else {
            Category.all.isSelected = false
        }
    }
    
    func toggleButton() {
        if list.contains(where: { c in
            c.isSelected == true
        }) {
            buttonActivated = true
        } else {
            buttonActivated = false
        }
    }
    
    func getBinding(category: Category) -> Binding<Category?> {
        let b = Binding<Category?> {
            category
        } set: { v in
            if let v {
                let index = CategoryDataSource.shared.list.firstIndex(of: category)!
                CategoryDataSource.shared.list[index] = v
            }
        }
        
        return b
    }
    
    func toggleAll() {
        if allClicked() {
            for c in CategoryDataSource.shared.list {
                let index = CategoryDataSource.shared.list.firstIndex(of: c)
                CategoryDataSource.shared.list[index!].isSelected = false
            }
            
            Category.all.isSelected = false
        } else {
            for c in CategoryDataSource.shared.list {
                let index = CategoryDataSource.shared.list.firstIndex(of: c)
                CategoryDataSource.shared.list[index!].isSelected = true
            }
            
            Category.all.isSelected = true
        }
        
        updateList()
        toggleButton()
    }
    
    func allClicked() -> Bool {
        for c in CategoryDataSource.shared.list {
            if c.isSelected == false {
                return false
            }
        }
        
        return true
    }
    
}
