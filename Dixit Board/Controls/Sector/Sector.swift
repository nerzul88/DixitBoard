//
//  Sector.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 08.04.2023.
//

import SwiftUI

// MARK: -

enum Direction: Double {
    case up = 0.0
    case right = 90.0
    case down = 180.0
    case left = 270.0
    case leftUp = 315.0
    case rightUp = 45.0
    case leftDown = 225.0
    case rightDown = 135.0
}

// MARK: -

struct Sector {
    
    let circleRadius: CGFloat
    let arrowDirection: Direction
    let arrowMargin: CGFloat
    let number: Int
    let isInitial: Bool

    init(circleRadius: CGFloat,
         arrowDirection: Direction,
         arrowMargin: CGFloat,
         number: Int,
         isInitial: Bool) {
        self.circleRadius = circleRadius
        self.arrowDirection = arrowDirection
        self.arrowMargin = arrowMargin
        self.number = number
        self.isInitial = isInitial
    }
    
}
