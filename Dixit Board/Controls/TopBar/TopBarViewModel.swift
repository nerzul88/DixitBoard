//
// TopBarViewModel.swift
//

import SwiftUI

class TopBarViewModel: ObservableObject {
    
    // MARK: - 
    
    var onTapMenu: (() -> Void)?
    var onTapClose: (() -> Void)?
                
    // MARK: -
    
    init(onTapMenu: (@escaping () -> Void), onTapClose: (@escaping () -> Void)) {
        self.onTapMenu = onTapMenu
        self.onTapClose = onTapClose
    }
    
}
