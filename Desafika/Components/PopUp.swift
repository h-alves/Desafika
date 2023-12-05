//
//  PopUp.swift
//  Desafika
//
//  Created by Henrique Semmer on 01/12/23.
//

import SwiftUI

struct PopUp: View {
    var mainAction: () -> Void
    var cancel: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.meiaNoite)
                .opacity(0.6)
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Text("Você tem certeza que deseja excluir esse desafio?")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(.chiclete)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 28)
                
                HStack(spacing: 0) {
                    Button {
                        cancel()
                    } label: {
                        Text("Cancelar")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.chiclete)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(.opala)
                    
                    Button {
                        mainAction()
                    } label: {
                        Text("Excluir")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(.quentão)
                }
            }
            .padding(.top, 36)
            .background(.desafikado)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .padding(.horizontal, 64)
        }
    }
}

#Preview {
    PopUp() {
        print("A")
    } cancel: {
        print("B")
    }
}
