//
//  Player.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 08.04.2023.
//

import Foundation
import SwiftUI

struct Player {
    
    let name: String
    let color: DXColor
    let number: Int
    let position: Int
    let isActive: Bool
    
    init(
        name: String,
        color: DXColor,
        number: Int,
        position: Int,
        isActive: Bool
    ) {
        self.name = name
        self.color = color
        self.number = number
        self.position = position
        self.isActive = isActive
    }
}
