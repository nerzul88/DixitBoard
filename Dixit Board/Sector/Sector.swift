//
//  Sector.swift
//  Dixit Board
//
//  Created by Андрей Рыбалкин on 08.04.2023.
//

import SwiftUI

struct Sector {
    
    let circleRadius: CGFloat
    let arrowDirection: CGFloat
    let arrowMargin: CGFloat
    let number: Int

    init(circleRadius: CGFloat, arrowDirection: CGFloat, arrowMargin: CGFloat, number: Int) {
        self.circleRadius = circleRadius
        self.arrowDirection = arrowDirection
        self.arrowMargin = arrowMargin
        self.number = number
    }
    
}
