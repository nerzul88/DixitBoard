//
// TopBarViewModel.swift
//

import SwiftUI

class TopBarViewModel: ObservableObject {
    
    // MARK: - Internal published var
    
    var onTapMenu: (() -> Void)?
    var onTapClose: (() -> Void)?
                
    // MARK: - Init
    
    init(onTapMenu: (@escaping () -> Void), onTapClose: (@escaping () -> Void)) {
        self.onTapMenu = onTapMenu
        self.onTapClose = onTapClose
    }
    
}
