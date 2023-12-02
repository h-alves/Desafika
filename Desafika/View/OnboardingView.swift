//
//  OnboardingView.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        VStack {
            /// Textos
            VStack(spacing: 24) {
                Text("Bem vindo(a)!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.meiaNoite)
                
                VStack(spacing: 16) {
                    
                    /// Texto 1
                    HStack(spacing: 16) {
                        Image(systemName: "sparkles")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.papaya)
                        
                        VStack(spacing: 0) {
                            Text("Descubra novas ideias")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.meiaNoite)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Receba ideias diferenciadas de atividades para fazer em casal")
                                .font(.callout)
                                .foregroundStyle(.meiaNoite)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    /// Texto 2
                    HStack(spacing: 16) {
                        Image(systemName: "building.2.crop.circle.fill")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.papaya)
                        
                        VStack(spacing: 0) {
                            Text("Sugestão de lugares")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.meiaNoite)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Lugares são sugeridos de forma customizada com cada desafio")
                                .font(.callout)
                                .foregroundStyle(.meiaNoite)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    /// Texto 3
                    HStack(spacing: 16) {
                        Image(systemName: "bookmark.circle.fill")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.papaya)
                        
                        VStack(spacing: 0) {
                            Text("Salve seu progresso")
                                .font(.headline)
                                .fontWeight(.semibold)
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
            
            Spacer()
            
            /// Botão
            Button {
                viewModel.createList()
                withAnimation(.linear) {
                    RouterService.shared.navigate(.home)
                }
            } label: {
                Text("Começar")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.desafikadoLight)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(.quentão)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .shadow(radius: 10, x: 2, y: 4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 48)
        .padding(.vertical, 64)
        .ignoresSafeArea(edges: .bottom)
        .background(.opala)
    }
}

#Preview {
    OnboardingView()
}
