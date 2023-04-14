//
// MenuButtonViewModel.swift
//

import SwiftUI

class MenuButtonViewModel: ObservableObject {
    
    // MARK: - Internal published var
    
    @Published var title: String
    @Published var icon: String? = nil
    
    init(title: String, icon: String? = nil) {
        self.title = title
        self.icon = icon
    }
}
