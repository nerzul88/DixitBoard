//
// GameView.swift
//

import SwiftUI

struct GameView: View {
    
    // MARK: - Internal state object var
    
    @ObservedObject var viewModel: GameViewModel
    
    // MARK: - Internal init
    
    init(viewModel: GameViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    // MARK: - Internal var
    
    var body: some View {
        EmptyView()
    }
}
