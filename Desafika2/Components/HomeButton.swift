//
//  HomeButton.swift
//  Desafika2
//
//  Created by Henrique Semmer on 13/10/23.
//

import SwiftUI

struct HomeButton: View {
    var activated: Bool
    var mainFunction: () -> Void
    
    var body: some View {
        Button {
            mainFunction()
        } label: {
            ZStack {
                Circle()
                    .foregroundStyle(buttonColor())
                    .opacity(opacity())
                    .frame(width: 180)
                Image(image())
                    .resizable()
                    .frame(width: 120, height: 120)
            }
        }
    }
    
    func buttonColor() -> Color {
        if activated {
            return .quentão
        }
        return .meiaNoite
    }
    
    func opacity() -> Double {
        if activated {
            return 1.0
        }
        return 0.2
    }
    
    func image() -> String {
        if activated {
            return "buttonOn"
        }
        return "buttonOff"
    }
}

#Preview {
    HomeButton(activated: true) {
        print("a")
    }
}
