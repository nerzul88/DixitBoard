//
//  Player.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 08.04.2023.
//

import Foundation
import SwiftUI

struct Player {
    
    var name: String
    var color: DXColor
    var number: Int
    var sector: Int
    var isActive: Bool
    var position: CGPoint
    
    init(
        name: String,
        color: DXColor,
        number: Int,
        sector: Int,
        isActive: Bool,
        position: CGPoint
    ) {
        self.name = name
        self.color = color
        self.number = number
        self.sector = sector
        self.isActive = isActive
        self.position = position
    }
}
