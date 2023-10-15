//
//  ViewModel.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var list: [Category] = CategoryDataModel.shared.list
    @Published var buttonActivated: Bool = false
    
    func updateList() {
        list = CategoryDataModel.shared.list
    }
    
    func selectCategory(category: Category) {
        let index = CategoryDataModel.shared.list.firstIndex { c in
            return c.title == category.title
        }
        
        CategoryDataModel.shared.list[index!].isSelected.toggle()
        
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
                let index = CategoryDataModel.shared.list.firstIndex(of: category)!
                CategoryDataModel.shared.list[index] = v
            }
        }
        
        return b
    }
    
    func toggleAll() {
        if allClicked() {
            for c in CategoryDataModel.shared.list {
                let index = CategoryDataModel.shared.list.firstIndex(of: c)
                CategoryDataModel.shared.list[index!].isSelected = false
            }
            
            Category.all.isSelected = false
        } else {
            for c in CategoryDataModel.shared.list {
                let index = CategoryDataModel.shared.list.firstIndex(of: c)
                CategoryDataModel.shared.list[index!].isSelected = true
            }
            
            Category.all.isSelected = true
        }
        
        updateList()
        toggleButton()
    }
    
    func allClicked() -> Bool {
        for c in CategoryDataModel.shared.list {
            if c.isSelected == false {
                return false
            }
        }
        
        return true
    }
    
}
