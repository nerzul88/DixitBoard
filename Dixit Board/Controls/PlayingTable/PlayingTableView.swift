//
// PlayingTableView.swift
//

import SwiftUI

struct PlayingTableView: View {
    
    // MARK: - Internal state object var
    
    @ObservedObject var viewModel: PlayingTableViewModel
        
    // MARK: - Internal init
    
    init(viewModel: PlayingTableViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    // MARK: - ViewBuilder var
    
    @ViewBuilder private var stepView: some View {
        ZStack {
            Capsule()
                .foregroundColor(viewModel.currentPlayer.color.swiftUIColor)
            Text("Step of player \(viewModel.currentPlayer.number)".uppercased())
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .bold, design: .default))
                .padding(.horizontal)
                .scaledToFill()
        }
    }
    
    @ViewBuilder private var topSectorView: some View {
        HStack(spacing: 16) {
            
            SectorView(viewModel: .init(sector: .init(circleRadius: Sizes.sectorRadius, arrowDirection: .down, arrowMargin: Sizes.arrowMargin, number: 30, isInitial: true), players: viewModel.players.filter { $0.position == 30 }))
                .frame(width: Sizes.sectorWidth)
            
            stepView
                .frame(height: Sizes.sectorWidth)
                .shadow(color: Color(Colors.shadow), radius: 3, x: 3, y: 3)
                .onTapGesture {
                    ()
                }
        }
    }
    
    
    @ViewBuilder private var mainView: some View {
        VStack {
            
            topSectorView
                .fixedSize(horizontal: false, vertical: true)
                .padding(8)
            
            VStack {
                ForEach(0..<6) { row in
                    HStack {
                        ForEach(0..<5) { column in
                            
                            let number = viewModel.getNumber(row, column)
                            let direction = viewModel.getDirection(row, column)
                            let sector: Sector = .init(
                                circleRadius: Sizes.sectorRadius,
                                arrowDirection: direction,
                                arrowMargin: Sizes.arrowMargin,
                                number: number,
                                isInitial: false
                            )
                            
                            SectorView(viewModel: .init(sector: sector, players: viewModel.players.filter { $0.position == number } ))
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - body
    
    var body: some View {
        mainView
    }
}
