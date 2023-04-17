//
// SectorViewModel.swift
//

import SwiftUI

class SectorViewModel: ObservableObject {
    
    // MARK: - Internal var
    
    @State var sector: Sector
    
    // MARK: - Init
    
    init(
        sector: Sector
    ) {
        self.sector = sector
    }
        
}
