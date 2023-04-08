//
// SectorViewModel.swift
//

import SwiftUI

class SectorViewModel: ObservableObject {
    
    // MARK: - Internal var
    
    @State var sector: Sector
    @State var players: [Player]
    
    // MARK: - Init
    
    init(
        sector: Sector,
        players: [Player]
    ) {
        self.sector = sector
        self.players = players
    }
    
    // MARK: - Internal func
    
}
