//
//  HomeView.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 28) {
            
            // Texto
            VStack(spacing: 8) {
                Text("Prontos para um novo desafio?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Text("Selecione as categorias que desejar e clique no rostinho para gerar um desafio!")
                    .font(.callout)
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
                
                // Slider
            }
            
            // Botão
            VStack {
                // Componente de botão
                
                Text("Gerar desafio")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
        }
        .padding(.horizontal, 32)
    }
}

#Preview {
    HomeView()
}
