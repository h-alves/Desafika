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
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(textColor())
                    .frame(width: 237, height: 55, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
                Button {
                    secondayFunc()
                } label: {
                    Image(systemName: buttonSymbol())
                        .font(.title)
                        .fontWeight(.bold)
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
        return .desafikado
    }
    
    func textColor() -> Color {
        if challenge.progress == .inProgress {
            return .desafikadoLight
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
        } secondayFunc: {
            
        }
        
        SavedCard(challenge: Challenge(description: "Teste muito longo mesmo pra testar se fica gigante o texto na tela, vamo ver!", category: Category.ambient, progress: Progress.finished)) {
        } secondayFunc: {
            
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.opala)
}
