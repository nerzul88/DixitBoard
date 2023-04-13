//
// PlayingTableViewModel.swift
//

import SwiftUI

class PlayingTableViewModel: ObservableObject {
    
    // MARK: -
    
    @Published var currentPlayer: Player = .init(name: "Andrey", color: .init(color: .pink), number: 3, sector: 3, isActive: true, position: .zero)
           
    @Published var players = [
        
        Player(name: "Михаил", color: .init(color: UIColor.red), number: 1, sector: 4, isActive: true, position: .zero),
        Player(name: "Дарья", color: .init(color: UIColor.green), number: 2, sector: 1, isActive: true, position: .zero),
        Player(name: "Платон", color: .init(color: UIColor.blue), number: 3, sector: 30, isActive: true, position: .zero),
        Player(name: "Тимофей", color: .init(color: UIColor.cyan), number: 4, sector: 2, isActive: true, position: .zero),
        Player(name: "Егор", color: .init(color: UIColor.yellow), number: 5, sector: 9, isActive: true, position: .zero),
        Player(name: "София", color: .init(color: UIColor.magenta), number: 6, sector: 16, isActive: true, position: .zero),
        Player(name: "Александр", color: .init(color: UIColor.orange), number: 7, sector: 1, isActive: true, position: .zero),
        Player(name: "Константин", color: .init(color: UIColor.purple), number: 8, sector: 3, isActive: true, position: .zero),
        Player(name: "Александра", color: .init(color: UIColor.brown), number: 9, sector: 3, isActive: true, position: .zero),
        Player(name: "Виктория", color: .init(color: .accentColor), number: 10, sector: 3, isActive: true, position: .zero),
        
    ]

    // MARK: -
    
    // Arrow direction calculating
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

    
    // Sector number calculating
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
