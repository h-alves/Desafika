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
        VStack {
            HStack {
                Text(viewModel.challengePresented.category.title)
                
                Image(systemName: viewModel.challengePresented.category.symbol)
            }
            
            Text(viewModel.challengePresented.description)
            
            if viewModel.challengePresented.progress == .inProgress {
                HStack {
                    Button {
                        viewModel.popupIsPresented = true
                        viewModel.sheetIsPresented = false
                    } label: {
                        Text("Excluir")
                    }
                    
                    Button {
                        viewModel.finishChallenge(challenge: viewModel.challengePresented)
                        viewModel.sheetIsPresented = false
                    } label: {
                        Text("Concluir")
                    }
                }
            } else if viewModel.challengePresented.progress == .finished {
                Text("Terminou")
            }
        }
        .padding(.top, 12)
        .background(.white)
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    ChallengeSheet(viewModel: SavedViewModel())
}
