//
//  HomeView.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 28) {
                /// Texto
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
                
                // Categorias (Versão Dinâmica)
                FlexStack {
                    ForEach(viewModel.list, id: \.title) { category in
                        CategoryButton(category: viewModel.getBinding(category: category)) {
                            viewModel.selectCategory(category: category)
                        }
                    }
                    
                    CategoryButton(category: viewModel.getBinding(category: Category.all)) {
                        viewModel.toggleAll()
                    }
                }
                
                /// Botão
                VStack(spacing: 12) {
                    HomeButton(activated: viewModel.buttonActivated) {
                        RouterService.shared.navigate(.challenge)
                    }
                    
                    Text("Gerar desafio")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.meiaNoite)
                        .opacity(0.5)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .padding(.top, 28)
            .ignoresSafeArea(edges: .bottom)
            .background(.opala)
            .onAppear {
                viewModel.toggleButton()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        RouterService.shared.navigate(.saved)
                    } label: {
                        ZStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 32))
                                .fontWeight(.semibold)
                                .foregroundColor(.desafikadoLight)
                                .shadow(radius: 10, x: 2, y: 4)
                            
                            Image(systemName: "bookmark.circle.fill")
                                .font(.system(size: 32))
                                .fontWeight(.semibold)
                                .foregroundColor(.quentão)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
