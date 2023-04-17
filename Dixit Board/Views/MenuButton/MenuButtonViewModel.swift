//
// MenuButtonViewModel.swift
//

import SwiftUI

class MenuButtonViewModel: ObservableObject {
    
    // MARK: -
    
    @Published var title: String
    @Published var icon: String? = nil
    
    // MARK: -

    init(title: String, icon: String? = nil) {
        self.title = title
        self.icon = icon
    }
}
