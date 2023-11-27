//
//  CategoryButton.swift
//  Desafika
//
//  Created by Henrique Semmer on 13/10/23.
//

import SwiftUI

struct CategoryButton: View {
    @Binding var category: Category?
    var mainFunction: () -> Void
    
    var body: some View {
        Button {
            mainFunction()
//            category.isSelected.toggle()
        } label: {
            HStack {
                Image(systemName: buttonSymbol())
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(textColor())
                
                Text(category!.title.capitalized)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(textColor())
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.quentão, lineWidth: 4)
            )
            .background(backgroundColor())
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    func backgroundColor() -> Color {
        if category!.isSelected {
            return .quentão
        }
        return .opala
    }
    
    func textColor() -> Color {
        if category!.isSelected {
            return .opala
        }
        return .quentão
    }
    
    func buttonSymbol() -> String {
        if category!.isSelected {
            return "checkmark.square.fill"
        }
        return "square"
    }
}

#Preview {
    VStack {
        CategoryButton(category: .constant(Category(title: "teste", symbol: "house", isSelected: false))) {
            print("a")
        }
        CategoryButton(category: .constant(Category(title: "teste", symbol: "house", isSelected: true))) {
            print("b")
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.opala)
}
