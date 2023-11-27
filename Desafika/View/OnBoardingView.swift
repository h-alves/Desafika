//
//  OnBoardingView.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        VStack(spacing: 200) {
            
            /// Textos
            VStack(spacing: 36) {
                Text("Bem vindo(a)!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.meiaNoite)
                
                VStack(spacing: 16) {
                    
                    /// Texto 1
                    HStack {
                        Image(systemName: "sparkles")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.papaya)
                        
                        VStack {
                            Text("Descubra novas ideias")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.meiaNoite)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Receba ideias diferenciadas de atividades para fazer em casal")
                                .font(.callout)
                                .foregroundStyle(.meiaNoite)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    /// Texto 2
                    HStack {
                        Image(systemName: "building.2.crop.circle.fill")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.papaya)
                        
                        VStack {
                            Text("Sugestão de lugares")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.meiaNoite)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Lugares são sugeridos de forma customizada com cada desafio")
                                .font(.callout)
                                .foregroundStyle(.meiaNoite)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    /// Texto 3
                    HStack {
                        Image(systemName: "bookmark.circle.fill")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.papaya)
                        
                        VStack {
                            Text("Salve seu progresso")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.meiaNoite)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Conclua desafios e tenha um histórico das suas atividades")
                                .font(.callout)
                                .foregroundStyle(.meiaNoite)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
            
            /// Botão
            Button {
               print("a")
            } label: {
                Text("Começar")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(.quentão)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 48)
        .background(.opala)
    }
}

#Preview {
    OnBoardingView()
}
