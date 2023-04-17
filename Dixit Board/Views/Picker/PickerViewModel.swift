//
// PickerViewModel.swift
//

import SwiftUI

class PickerViewModel: ObservableObject {
    
    // MARK: - 
    
    @Published var newPlayerName: String = "" { didSet { canAddPlayer = !newPlayerName.isEmpty } }
    @Published var newPlayerColor: String
    @Published var expectedNumber: Int
    
    @Published var canAddPlayer: Bool = false
    
    // MARK: -
    
    var avaiableColors: [String]

    // MARK: -
    
    init(
        expectedNumber: Int,
        avaiableColors: [String]
    ) {
        self.avaiableColors = avaiableColors
        self.newPlayerColor = avaiableColors[0]
        self.expectedNumber = expectedNumber
    }
}
