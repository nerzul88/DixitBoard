//
// PlayersBottomViewModel.swift
//

import SwiftUI

class PlayersBottomViewModel: ObservableObject {
    
    // MARK: - Internal published var
    
    @State var players: [Player]
    
    // MARK: - Init
    
    init(
        players: [Player]
    ) {
        self.players = players
    }

    // MARK: - Internal func
}
