//
// StepPickerViewModel.swift
//

import Foundation

class StepPickerViewModel: ObservableObject {
    
    // MARK: - Internal published var
        
    @Published var oldSector: Int
    @Published var stepsCount: Int = 1
    @Published var playersCount: Int

    @Published var name: String
    @Published var color: String

    init(oldSector: Int, name: String, color: String, playersCount: Int) {
        self.name = name
        self.oldSector = oldSector
        self.color = color
        self.playersCount = playersCount
    }

}
