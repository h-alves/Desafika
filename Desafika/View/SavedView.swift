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
                    Spacer()
                    
                    /// Em Progresso
                    VStack(spacing: 16) {
                        VStack(spacing: 12) {
                            Image("coupleLove")
                                .resizable()
                                .frame(width: 80, height: 42.22)
                            
                            Text("Desafios em progresso")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.meiaNoite)
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
                            .font(.callout)
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
                        Image(systemName: "house.circle.fill")
                            .font(.system(size: 32))
                            .fontWeight(.semibold)
                            .foregroundColor(.quentão)
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
                        viewModel.sheetIsPresented = false
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
