//
// SectorViewModel.swift
//

import SwiftUI

class SectorViewModel: ObservableObject {
    
    // MARK: - Internal var
    
    let circleRadius: CGFloat
    let arrowDirection: Angle
    let arrowMargin: CGFloat
    let number: Int

    @State var players: [Color]
    
    // MARK: - Init
    
    init(
        circleRadius: CGFloat,
        arrowDirection: Angle,
        arrowMargin: CGFloat,
        number: Int,
        players: [Color]
    ) {
        self.circleRadius = circleRadius
        self.arrowDirection = arrowDirection
        self.arrowMargin = arrowMargin
        self.number = number
        self.players = players
    }
    
    // MARK: - Internal func
    
}
