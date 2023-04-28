//
// PlayerViewModel.swift
//

import SwiftUI

class PlayerViewModel: ObservableObject {
    
    // MARK: - Internal var
    
    @Published var player: Player
    @Published var height: CGFloat

    // MARK: - Init
    
    init(
        player: Player,
        height: CGFloat = 50) {
        self.player = player
        self.height = height
    }

}
