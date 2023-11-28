//
//  StorageService.swift
//  Desafika
//
//  Created by Heloisa Pereira Machado on 28/11/23.
//

import Foundation
import SwiftUI

struct StorageService {
    static let shared = StorageService()
    private let onboardingKey = "hasSeenOnboarding"

    // Set the onboarding status
    func setOnboardingSeen(_ hasSeen: Bool) {
        UserDefaults.standard.set(hasSeen, forKey: onboardingKey)
    }
    
    // Check if the user has seen the onboarding
    func hasSeenOnboarding() -> Bool {
        return UserDefaults.standard.bool(forKey: onboardingKey)
    }
}
