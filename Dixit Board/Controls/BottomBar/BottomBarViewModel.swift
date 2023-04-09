//
// BottomBarViewModel.swift
//

import SwiftUI

class BottomBarViewModel: ObservableObject {
    
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
