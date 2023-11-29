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
                Spacer()
                
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
                .frame(maxWidth: 300)
                
                /// Categorias (Versão Dinâmica)
                //            FlexStack {
                //                ForEach(viewModel.list, id: \.title) { category in
                //                    CategoryButton(category: viewModel.getBinding(category: category)) {
                //                        viewModel.selectCategory(category: category)
                //                    }
                //                }
                //                
                //                CategoryButton(category: viewModel.getBinding(category: Category.all)) {
                //                    viewModel.toggleAll()
                //                }
                //            }
                
                /// Categorias (Versão Estática)
                VStack {
                    HStack {
                        CategoryButton(category: viewModel.getBinding(category: viewModel.list[0])) {
                            viewModel.selectCategory(category: viewModel.list[0])
                        }
                        CategoryButton(category: viewModel.getBinding(category: viewModel.list[1])) {
                            viewModel.selectCategory(category: viewModel.list[1])
                        }
                        CategoryButton(category: viewModel.getBinding(category: viewModel.list[2])) {
                            viewModel.selectCategory(category: viewModel.list[2])
                        }
                    }
                    
                    HStack {
                        CategoryButton(category: viewModel.getBinding(category: viewModel.list[3])) {
                            viewModel.selectCategory(category: viewModel.list[3])
                        }
                        CategoryButton(category: viewModel.getBinding(category: viewModel.list[4])) {
                            viewModel.selectCategory(category: viewModel.list[4])
                        }
                    }
                    
                    HStack {
                        CategoryButton(category: viewModel.getBinding(category: viewModel.list[5])) {
                            viewModel.selectCategory(category: viewModel.list[5])
                        }
                        CategoryButton(category: viewModel.getBinding(category: Category.all)) {
                            viewModel.toggleAll()
                        }
                    }
                }
                
                /// Raio de distância
                //            VStack {
                //                Text("Sugerir lugares em um raio de:")
                //                    .font(.footnote)
                //                    .foregroundStyle(.meiaNoite)
                //                    .opacity(0.5)
                //                
                //                // Slider
                //            }
                
                Spacer()
                
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
            .background(.opala)
            .onAppear {
                viewModel.toggleButton()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        RouterService.shared.navigate(.saved)
                    } label: {
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

#Preview {
    HomeView()
}
