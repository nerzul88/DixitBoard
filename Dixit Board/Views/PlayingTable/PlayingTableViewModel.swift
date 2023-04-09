//
// PlayingTableViewModel.swift
//

import SwiftUI

class PlayingTableViewModel: ObservableObject {
    
    // MARK: - Internal published var
    
    @Published var currentPlayer: Player = .init(name: "Andrey", color: .init(color: .pink), number: 3, position: 3, isActive: true)
        
    // MARK: - Internal var
        
    // MARK: - Internal func
    
    // Sector number calculating
    func getDirection(_ vid: Int, _ hid: Int? = nil) -> Direction {
        
        guard let hid else { return vid == 5 ? .right : .down }
        
        return vid == 0 && hid == 0
        ? .leftUp
        : vid % 2 == 0
        ? hid == 0 ? .up
        : .left
        : hid == 3 ? .up
        : .right

    }
    
    
    // Sector number calculating
    func getNumber(_ vid: Int, _ hid: Int) -> Int {
                
        var cellNum = 0

        if vid % 2 == 0 { // Even string
            cellNum = (vid + 1) * 4 - (3 - hid)
        } else {          // Odd string
            cellNum = (vid + 1) * 4 - hid
        }

        return 30 - cellNum
    }
    
}
