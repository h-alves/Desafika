//
//  NoChallengeView.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct NoChallengeView: View {
    var body: some View {
        HStack {
            Image(systemName: "circle")
            Text("Vocês já completaram todos os desafios possíveis!")
                .font(.footnote)
                .foregroundStyle(.meiaNoite)
                .opacity(0.5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 32)
        .background(.opala)
    }
}

#Preview {
    NoChallengeView()
}
