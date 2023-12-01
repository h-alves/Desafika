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
            Text(viewModel.challengePresented.description)
            
            Button {
                viewModel.deleteChallenge(challenge: viewModel.challengePresented)
                viewModel.isPresented = false
            } label: {
                Text("Excluir")
            }
            
            Button {
                viewModel.finishChallenge(challenge: viewModel.challengePresented)
                viewModel.isPresented = false
            } label: {
                Text("Concluir")
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
