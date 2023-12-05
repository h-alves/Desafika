//
//  ChallengeSheet.swift
//  Desafika
//
//  Created by Henrique Semmer on 30/11/23.
//

import SwiftUI

struct ChallengeSheet: View {
    @ObservedObject var viewModel: SavedViewModel
    
    var body: some View {
        VStack(spacing: 100) {
            VStack(spacing: 8) {
                HStack(alignment: .bottom, spacing: 3) {
                    Text(viewModel.challengePresented.category.title)
                        .font(.caption)
                    
                    Image(systemName: viewModel.challengePresented.category.symbol)
                        .font(.caption)
                }
                .fontWeight(.semibold)
                .foregroundStyle(.meiaNoite)
                .opacity(0.6)
                
                Text(viewModel.challengePresented.description)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.chiclete)
                    .multilineTextAlignment(.center)
            }
            
            if viewModel.challengePresented.progress == .inProgress {
                HStack {
                    Button {
                        viewModel.popupIsPresented = true
                        viewModel.sheetIsPresented = false
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "x.circle.fill")
                            
                            Text("Excluir")
                        }
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.desafikadoLight)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(.quentão)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button {
                        viewModel.finishChallenge(challenge: viewModel.challengePresented)
                        viewModel.sheetIsPresented = false
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "flag.fill")
                            
                            Text("Concluir")
                        }
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.desafikadoLight)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(.quentão)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            } else if viewModel.challengePresented.progress == .finished {
                HStack(spacing: 6) {
                    Image(systemName: "checkmark.circle.fill")
                    
                    Text("Concluído")
                }
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.meiaNoite)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(.opala)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 100)
        .padding(.horizontal, 48)
        .background(.desafikado)
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    ChallengeSheet(viewModel: SavedViewModel())
}
