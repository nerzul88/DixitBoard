//
// PlayerViewModel.swift
//

import SwiftUI

class PlayerViewModel: ObservableObject {
    
    // MARK: - Internal var
    
    @State var player: Player
    
    // MARK: - Init
    
    init(
        player: Player
    ) {
        self.player = player
    }
    
    // MARK: - Internal func
    
}
