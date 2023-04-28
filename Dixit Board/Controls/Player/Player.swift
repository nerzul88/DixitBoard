//
//  Player.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 08.04.2023.
//

import Foundation

struct Player: Equatable {
    
    // MARK: -
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name &&
        lhs.color == rhs.color &&
        lhs.number == rhs.number &&
        lhs.sector == rhs.sector &&
        lhs.position == rhs.position &&
        lhs.isWon == rhs.isWon
    }
    
    // MARK: -
    
    var name: String
    var color: String
    var number: Int
    var sector: Int
    var position: CGPoint
    var isWon: Bool = false
    
    init(name: String,
         color: String,
         number: Int,
         sector: Int,
         position: CGPoint) {
        self.name = name
        self.color = color
        self.number = number
        self.sector = sector
        self.position = position
    }
}
