//
// BottomBarViewModel.swift
//

import SwiftUI

class BottomBarViewModel: ObservableObject {
    
    // MARK: - Internal published var
    
    @Binding var players: [Player]
    
    // MARK: - Init
    
    init(
        players: Binding<[Player]>
    ) {
        self._players = players
    }

    // MARK: - Internal func
}
