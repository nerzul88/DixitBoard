//
// BottomBarViewModel.swift
//

import SwiftUI

class BottomBarViewModel: ObservableObject {
    
    // MARK: - Internal published var
    
    @Published var players: [Player]
    @Published var selectedPlayer: Player?
    
    // MARK: - Init
    
    init(
        players: [Player]
    ) {
        self.players = players
    }

}
