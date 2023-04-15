//
// GameViewModel.swift
//

import SwiftUI

class GameViewModel: ObservableObject {
    
    // MARK: - Internal published var
    
    @Published var players: [Player]
    @Published var selectedPlayerIndex: Int?
    
    // MARK: -

    init(players: [Player]) {
        self.players = players
    }

}
