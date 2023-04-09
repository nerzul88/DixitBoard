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
    
    // MARK: - ViewBuilder var
    
    @ViewBuilder private var mainView: some View {
        VStack {
            
            TopBarView(viewModel: .init(onTapMenu: viewModel.onTapMenu, onTapClose: viewModel.onTapClose))
            
            PlayingTableView(viewModel: .init())
            
            BottomBarView(viewModel: .init(players: MockData.palyers))
        }
        .ignoresSafeArea()
    }
    
    // MARK: - body
    
    var body: some View {
        mainView
    }
}
    // MARK: -
    
    struct Example_Preview: PreviewProvider {
        static var previews: some View {
            GameView(viewModel: .init(onTapMenu: {
                ()
            }, onTapClose: {
                ()
            }))
        }
    }
