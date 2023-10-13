//
//  ChallengeView.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct ChallengeView: View {
    @ObservedObject var viewModel = ChallengeViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            // Desafio & Botões
            VStack {
                VStack(spacing: 16) {
                    VStack {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.chiclete)
                        Text("Seu desafio é:")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.meiaNoite)
                    }
                    
                    // Componente de Desafio
                    ChallengeCard(challenge: viewModel.challenge)
                }
                
                HStack(alignment: .top, spacing: 16) {
                    VStack {
                        // Botão de Aceitar Desafio
                        Button {
                            viewModel.acceptChallenge()
                        } label: {
                            Text("aceitar")
                        }
                        
                        Text("Aceito")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.meiaNoite)
                            .opacity(0.5)
                    }
                    
                    Image(systemName: "heart.fill")
                        .font(.title2)
                        .foregroundStyle(.chiclete)
                    
                    VStack {
                        // Botão de Mudar Desafio
                        Button {
                            viewModel.getRandomChallenge()
                        } label: {
                            Text("outro")
                        }
                        
                        Text("Outro")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.meiaNoite)
                            .opacity(0.5)
                    }
                }
            }
            
            Spacer()
            
            // Lugares
            VStack {
                HStack {
                    // Imagem do Casalzinho
                    Image(systemName: "circle")
                    
                    Text("Sugerimos alguns lugares para realizar esse desafio:")
                        .font(.footnote)
                        .foregroundStyle(.meiaNoite)
                        .opacity(0.5)
                        .frame(width: 160)
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        // Placeholder
                        ForEach(1...10, id: \.self) { _ in
                            Text("teste")
                        }
                    }
                    .padding(.horizontal, 32)
                }
                .padding(.horizontal, -32)
                .scrollIndicators(.hidden)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 32)
        .background(.opala)
    }
}

#Preview {
    ChallengeView()
}
