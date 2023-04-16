//
// GameView.swift
//

import SwiftUI

struct GameView: View {
    
    // MARK: - Internal state object var
    
    @ObservedObject var viewModel: GameViewModel
    
    // MARK: -

    @State var showStepPicker: Bool = false
    @State var showWinner: Bool = false
    @State var showOver: Bool = false

    @State var winnerName: String = "Игрок"

    // MARK: -

    @Binding var showGame: Bool

    // MARK: - Internal init
    
    init(viewModel: GameViewModel, showGame: Binding<Bool>) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        self._showGame = showGame
    }
    
    // MARK: - ViewBuilder var
    
    @ViewBuilder private var mainView: some View {
        VStack {
            
            TopBarView(viewModel: .init(onTapMenu: {
                ()
            }, onTapClose: {
                showGame.toggle()
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
            
            GeometryReader { proxy in
                Image("wild")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 25)
                .frame(
                    width: proxy.size.width,
                    height: proxy.size.height
                )
                .overlay {
                    Color.black.opacity(0.5)
                }
            }

            mainView
            
            if showStepPicker {
                if let index = viewModel.selectedPlayerIndex {
                    
                    let player = viewModel.players[index]
                    
                    StepPickerView(viewModel: .init(oldSector: player.sector, name: player.name, color: player.color, playersCount: viewModel.players.count), showPicker: $showStepPicker) { count in
                        viewModel.makeMove(count, for: index) { name in
                            winnerName = name
                            showWinner.toggle()
                        }
                    }
                    .background(Color.black.opacity(showStepPicker ? 0.5 : 0))

                }
            }
            
            if showWinner {
                WinnerView(name: winnerName, showWinner: $showWinner) { mode in
                    switch mode {
                    case .new:
                        viewModel.setNewGame()
                        showWinner.toggle()
                    case .close:
                        showWinner.toggle()
                        showOver.toggle()
                    case .counitue:
                        showWinner.toggle()
                    }
                }
            }
            
            if showOver {
                GameOverView(names: viewModel.getWinners(), showGameOver: $showOver) { mode in
                    switch mode {
                    case .new:
                        viewModel.setNewGame()
                        showOver.toggle()
                    case .close:
                        showOver.toggle()
                        showGame.toggle()
                    default: return
                    }
                }
            }

        }
    }
}
// MARK: -

struct Example_Preview: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: .init(players: MockData.players), showGame: .constant(true))
    }
}
