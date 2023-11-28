//
//  SavedCard.swift
//  Desafika
//
//  Created by Henrique Semmer on 13/10/23.
//

import SwiftUI

struct SavedCard: View {
    @State var challenge: Challenge
    var mainFunc: () -> Void
    var secondayFunc: () -> Void
    
    var body: some View {
        Button {
            mainFunc()
        } label: {
            HStack(spacing: 16) {
                Text(challenge.description)
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(textColor())
                    .frame(width: 237, height: 44, alignment: .leading)
                
                Button {
                    secondayFunc()
                } label: {
                    Image(systemName: buttonSymbol())
                        .font(.title)
                        .foregroundStyle(textColor())
                }
            }
            .padding(16)
            .background(backgroundColor())
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
    
    func backgroundColor() -> Color {
        if challenge.progress == .inProgress {
            return .quentão
        }
        return .white
    }
    
    func textColor() -> Color {
        if challenge.progress == .inProgress {
            return .opala
        }
        return .chiclete
    }
    
    func buttonSymbol() -> String {
        if challenge.progress == .inProgress {
            return "circle"
        }
        return "checkmark.circle.fill"
    }
}

#Preview {
    VStack {
        SavedCard(challenge: Challenge(description: "Teste muito longo mesmo pra testar se fica gigante o texto na tela, vamo ver!", category: Category.ambient, progress: Progress.inProgress)) {
            print("teste")
        } secondayFunc: {
            
        }
        
        SavedCard(challenge: Challenge(description: "Teste muito longo mesmo pra testar se fica gigante o texto na tela, vamo ver!", category: Category.ambient, progress: Progress.finished)) {
            print("teste 2")
        } secondayFunc: {
            
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.opala)
}
