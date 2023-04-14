//
// GameViewModel.swift
//

import SwiftUI

class GameViewModel: ObservableObject {
    
    // MARK: - Internal published var
    
    @Published var players = MockData.players
    
}
