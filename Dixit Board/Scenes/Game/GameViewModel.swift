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
    
    // MARK: -

    func makeMove(_ steps: Int, for index: Int, lapHandler: @escaping ((String) -> Void)) {
        
        let newSector = players[index].sector + steps
        
        if newSector >= 30 {
            players[index].sector = newSector > 30 ? newSector - 31 : newSector
            players[index].isWon = true
            lapHandler(players[index].name)
        } else {
            players[index].sector = newSector
        }
    }
    
    func setNewGame() {
        players.indices.forEach { players[$0].sector = 0; players[$0].isWon = false }
    }
    
    func getWinners() -> [String] {
        return players.filter { $0.isWon }.map { $0.name }
    }

}
