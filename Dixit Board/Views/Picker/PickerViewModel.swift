//
// PickerViewModel.swift
//

import SwiftUI

class PickerViewModel: ObservableObject {
    
    // MARK: - Internal published var
    
    @Published var newPlayerName: String { didSet { canAddPlayer = !newPlayerName.isEmpty } }
    @Published var newPlayerColor: Color
    @Published var expectedNumber: Int
    
    @Published var canAddPlayer: Bool = false
    
    init(newPlayerName: String = "", newPlayerColor: Color = .clear, expectedNumber: Int) {
        self.newPlayerName = newPlayerName
        self.newPlayerColor = newPlayerColor
        self.expectedNumber = expectedNumber
    }

}
