//
// PickerViewModel.swift
//

import SwiftUI

class PickerViewModel: ObservableObject {
    
    // MARK: - 
    
    @Published var newPlayerName: String = "" {
        didSet {
            canAddPlayer = !newPlayerName.isEmpty
        }
    }
    @Published var newPlayerColor: String
    @Published var expectedNumber: Int
    @Published var canAddPlayer: Bool = false
    
    // MARK: -
    
    var availableColors: [String]

    // MARK: -
    
    init(expectedNumber: Int,
        availableColors: [String]) {
        self.availableColors = availableColors
        self.newPlayerColor = availableColors[0]
        self.expectedNumber = expectedNumber
    }
}
