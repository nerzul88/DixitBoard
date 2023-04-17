//
// PlayingTableViewModel.swift
//

import SwiftUI

class PlayingTableViewModel: ObservableObject {
    
    // MARK: -
    
    @Published var currentPlayer: Player?
    @Binding var players: [Player]
        
    init(currentPlayer: Player? = nil, players: Binding<[Player]>) {
        self.currentPlayer = currentPlayer
        self._players = players
    }
        
    // MARK: -
    
    func setupCurrentPlayer(for index: Int) {
        guard players.count > index else { return }
        currentPlayer = players[index]
    }
    
    /// Arrow direction calculating
    func getDirection(_ row: Int, _ column: Int) -> Direction {
        
        return column == 0
        ? row == 5
        ? .right
        : .down
        : row == 0 && column == 1
        ? .leftUp
        : row % 2 == 0
        ? column == 1 ? .up
        : .left
        : column == 4 ? .up
        : .right
        
    }
    
    
    /// Sector number calculating
    func getNumber(_ row: Int, _ column: Int) -> Int {
        
        var cellNum = 0
        
        if column == 0 { return row } else {
            
            if row % 2 == 0 { // Even string
                cellNum = (row + 1) * 4 - (3 - column)
                return 31 - cellNum
            } else {          // Odd string
                cellNum = (row + 1) * 4 - column
                return 29 - cellNum
            }
            
        }
    }
    
}
