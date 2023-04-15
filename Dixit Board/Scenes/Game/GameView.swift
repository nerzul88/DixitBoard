//
// GameView.swift
//

import SwiftUI

struct GameView: View {
    
    // MARK: - Internal state object var
    
    @ObservedObject var viewModel: GameViewModel
    
    // MARK: -

    @State var showStepPicker: Bool = false

    // MARK: - Internal init
    
    init(viewModel: GameViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    // MARK: - ViewBuilder var
    
    @ViewBuilder private var mainView: some View {
        VStack {
            
            TopBarView(viewModel: .init(onTapMenu: {
                ()
            }, onTapClose: {
                ()
            }) )
            
            PlayingTableView(viewModel: .init(players: $viewModel.players) )
            
            BottomBarView(viewModel: .init(players: viewModel.players)) { index in
                viewModel.selectedPlayerIndex = index
                showStepPicker.toggle()
            }
            
        }
        .ignoresSafeArea()
    }
    
    // MARK: - body
    
    var body: some View {
        ZStack {
            mainView
            
            if showStepPicker {
                if let index = viewModel.selectedPlayerIndex {
                    
                    let player = viewModel.players[index]
                    
                    StepPickerView(viewModel: .init(oldSector: player.sector, name: player.name, color: player.color), showPicker: $showStepPicker) { sector in
                        
                        viewModel.players[index].sector = sector
                        
                    }
                }
            }
        }
    }
}
// MARK: -

struct Example_Preview: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: .init(players: MockData.players))
    }
}
