//
// SetupViewModel.swift
//

import SwiftUI

class SetupViewModel: ObservableObject {
    
    // MARK: - Internal published var
    
    @Published var players: [Player] = [] { didSet { setupButtons() } }
    
    @Published var canAddPlayers = true
    @Published var canStartGame = false
    
    // MARK: -
    
    var availableColors: [String] {
        return Storage.shared.colors.filter { !players.map({$0.color}).contains($0) }
    }

    // MARK: -

    
    private func setupButtons() {
        self.canAddPlayers = self.players.count < 10
        self.canStartGame = self.players.count >= 3
    }
}
