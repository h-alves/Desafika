//
//  SavedView.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct SavedView: View {
    @ObservedObject var viewModel = SavedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    /// Em Progresso
                    VStack(spacing: 16) {
                        VStack(spacing: 12) {
                            Image("savedCouple")
                                .resizable()
                                .frame(width: 80, height: 42.22)
                            
                            Text("Desafios em progresso")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.meiaNoite)
                                .multilineTextAlignment(.center)
                        }
                        
                        VStack(spacing: 12) {
                            ForEach(viewModel.inProgress(), id: \.description) { c in
                                SavedCard(challenge: c) {
                                    viewModel.challengePresented = c
                                    viewModel.sheetIsPresented = true
                                } secondayFunc: {
                                    viewModel.finishChallenge(challenge: c)
                                }
                            }
                        }
                    }
                    
                    /// Concluídos
                    VStack(spacing: 12) {
                        Text("Concluídos")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.meiaNoite)
                            .opacity(0.5)
                        
                        ForEach(viewModel.finished(), id: \.description) { c in
                            SavedCard(challenge: c) {
                                viewModel.challengePresented = c
                                viewModel.sheetIsPresented = true
                            } secondayFunc: {
                                viewModel.unfinishChallenge(challenge: c)
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .padding(.top, 32)
            .background(.opala)
            .scrollIndicators(.hidden)
            .onAppear {
                viewModel.subscribe()
            }
            .onDisappear {
                viewModel.cancelSubscription()
            }
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
            .sheet(isPresented: $viewModel.sheetIsPresented) {
                ChallengeSheet(viewModel: viewModel)
            }
            .overlay {
                if viewModel.popupIsPresented {
                    PopUp() {
                        viewModel.deleteChallenge(challenge: viewModel.challengePresented)
                        viewModel.popupIsPresented = false
                    } cancel: {
                        viewModel.popupIsPresented = false
                    }
                }
            }
        }
    }
}

#Preview {
    SavedView()
}
