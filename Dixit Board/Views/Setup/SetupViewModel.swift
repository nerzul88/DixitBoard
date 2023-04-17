//
// SetupViewModel.swift
//

import SwiftUI

class SetupViewModel: ObservableObject {
    
    // MARK: -
    
    @Binding var players: [Player]
    
    // MARK: -
    
    var availableColors: [String] {
        return Storage.shared.colors.filter { !players.map({$0.color}).contains($0) }
    }

    // MARK: -

    init(players: Binding<[Player]>) {
        self._players = players
        
    }
}
