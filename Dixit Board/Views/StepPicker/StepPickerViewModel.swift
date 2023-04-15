//
// StepPickerViewModel.swift
//

import Foundation

class StepPickerViewModel: ObservableObject {
    
    // MARK: - Internal published var
        
    @Published var oldSector: Int
    @Published var newSector: Int

    @Published var name: String
    @Published var color: DXColor

    init(oldSector: Int, name: String, color: DXColor) {
        self.name = name
        self.oldSector = oldSector
        self.newSector = oldSector
        self.color = color
    }

}
