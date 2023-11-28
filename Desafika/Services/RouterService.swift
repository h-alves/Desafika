//
//  RouterService.swift
//  Desafika
//
//  Created by Heloisa Pereira Machado on 28/11/23.
//

import Foundation
import SwiftUI

class RouterService: ObservableObject {
    
    static var shared = RouterService()

    @Published var screen: Screen = .splash
    
    func navigate(_ screen: Screen) {
        self.screen = screen
    }
    
}
