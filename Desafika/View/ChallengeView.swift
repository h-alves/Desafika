//
//  ChallengeView.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct ChallengeView: View {
    @ObservedObject var viewModel = ChallengeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.noChallenge {
                    NoChallengeView()
                } else {
                    ScrollView {
                        challengeView
                    }
                }
            }
            .background(.opala)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        RouterService.shared.navigate(.home)
                    } label: {
                        ZStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 32))
                                .fontWeight(.semibold)
                                .foregroundColor(.desafikadoLight)
                                .shadow(radius: 10, x: 2, y: 4)
                            
                            Image(systemName: "house.circle.fill")
                                .font(.system(size: 32))
                                .fontWeight(.semibold)
                                .foregroundColor(.quentão)
                        }
                    }
                }
            }
        }
    }
    
    var challengeView: some View {
        VStack(spacing: 48) {
            /// Desafio & Botões
            VStack(spacing: 24) {
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
                    
                    ChallengeCard(challenge: viewModel.challenge)
                }
                
                /// Botões
                HStack(alignment: .top, spacing: 16) {
                    VStack {
                        Button {
                            viewModel.acceptChallenge()
                            RouterService.shared.navigate(.saved)
                        } label: {
                            Image("accept")
                                .resizable()
                                .frame(width: 80, height: 82)
                                .shadow(radius: 10, x: 2, y: 4)
                        }
                        
                        Text("Salvar")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.meiaNoite)
                            .opacity(0.5)
                    }
                    
                    Image(systemName: "heart.fill")
                        .font(.title2)
                        .foregroundStyle(.chiclete)
                    
                    VStack {
                        Button {
                            viewModel.getRandomChallenge()
                        } label: {
                            Image("other")
                                .resizable()
                                .frame(width: 80, height: 82)
                                .shadow(radius: 10, x: 2, y: 4)
                        }
                        .disabled(viewModel.loadingPlaces)
                        
                        Text("Outro")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.meiaNoite)
                            .opacity(0.5)
                    }
                }
            }
            
            Spacer()
            
            /// Lugares
            VStack(spacing: 24) {
                if viewModel.challenge.category == Category.house {
                    HStack(spacing: 16) {
                        Image("home")
                            .resizable()
                            .frame(width: 74, height: 65)
                        
                        Text("Sugerimos fazer essa atividade em casa.")
                            .font(.footnote)
                            .foregroundStyle(.meiaNoite)
                            .opacity(0.5)
                    }
                } else {
                    HStack(spacing: 16) {
                        Image("noCouple")
                            .resizable()
                            .frame(width: 80, height: 42.22)
                        
                        Text(viewModel.placesText())
                            .font(.footnote)
                            .foregroundStyle(.meiaNoite)
                            .opacity(0.5)
                            .frame(width: 160)
                    }
                    
                    if (!viewModel.loadingPlaces) {
                        ScrollView(.horizontal) {
                            HStack(spacing: 16) {
                                ForEach(viewModel.places, id: \.name) { place in
                                    PlaceCard(place: place)
                                }
                            }
                            .padding(.horizontal, 32)
                        }
                        .padding(.horizontal, -32)
                        .scrollIndicators(.hidden)
                    }
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 32)
        .padding(.top, 24)
        .background(.opala)
        .onAppear {
            viewModel.getRandomChallenge()
        }
       
    }
}

#Preview {
    ChallengeView()
}
