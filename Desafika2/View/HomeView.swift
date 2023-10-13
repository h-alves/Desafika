//
//  HomeView.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 28) {
            // Texto
            VStack(spacing: 8) {
                Text("Prontos para um novo desafio?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.meiaNoite)
                    .multilineTextAlignment(.center)
                Text("Selecione as categorias que desejar e clique no rostinho para gerar um desafio!")
                    .font(.callout)
                    .foregroundStyle(.meiaNoite)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: 300)
            
            // Categorias
            VStack {
                
            }
            
            // Raio de distância
            VStack {
                Text("Sugerir lugares em um raio de:")
                    .font(.footnote)
                    .foregroundStyle(.meiaNoite)
                    .opacity(0.5)
                
                // Slider
            }
            
            // Botão
            VStack(spacing: 12) {
                // Componente de botão
                HomeButton(activated: true) {
                    print("Clicado")
                }
                
                Text("Gerar desafio")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.meiaNoite)
                    .opacity(0.5)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 32)
        .background(.opala)
    }
}

#Preview {
    HomeView()
}
