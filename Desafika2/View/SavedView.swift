//
//  SavedView.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct SavedView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                Spacer()
                
                // Em Progresso
                VStack(spacing: 16) {
                    VStack(spacing: 12) {
                        Image(systemName: "circle")
                        Text("Desafios em progresso")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.meiaNoite)
                    }
                    
                    VStack(spacing: 12) {
                        ForEach(1...3, id: \.self) { _ in
                            Text("Tem que fazer")
                        }
                    }
                }
                
                // Concluídos
                VStack(spacing: 12) {
                    Text("Concluídos")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundStyle(.meiaNoite)
                        .opacity(0.5)
                    
                    ForEach(1...10, id: \.self) { _ in
                        Text("Teste")
                    }
                }
            }
        }
        .padding(.horizontal, 32)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SavedView()
}
