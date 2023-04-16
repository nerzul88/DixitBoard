//
// PlayingTableView.swift
//

import SwiftUI

struct Coordinate {
    var point: CGPoint
    var sector: Int
}

struct PlayingTableView: View {
    
    // MARK: - Internal state object var
    
    @ObservedObject var viewModel: PlayingTableViewModel
    
    @State var coordinates: [Coordinate] = []
    
    // MARK: - Internal init
    
    init(viewModel: PlayingTableViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    // MARK: - ViewBuilder var
    
    @ViewBuilder private var stepView: some View {
        ZStack {
            Capsule()
                .foregroundColor(Color(Colors.actor))
                .addBorder(Color(Colors.main), cornerRadius: 30)
            Text("Ход игрока 1".uppercased())
                .foregroundColor(Color(Colors.main))
                .font(.system(size: 25, weight: .bold, design: .default))
                .padding(.horizontal)
                .scaledToFill()
        }
    }
    
    @ViewBuilder private var mainView: some View {
        
        ZStack {
            VStack {
                ForEach(0..<7) { row in
                    HStack {
                        ForEach(0..<5) { column in
                            
                            if row == 0 && column == 0 {
                                HStack(spacing: 16) {
                                    SectorView(viewModel: .init(sector: .init(circleRadius: Sizes.sectorRadius, arrowDirection: .down, arrowMargin: Sizes.arrowMargin, number: 30, isInitial: true)))
                                        .scaledToFit()
                                    
                                    stepView
                                        .frame(height: Sizes.sectorWidth)
                                        .shadow(color: Color(Colors.shadow), radius: 3, x: 3, y: 3)
                                        .padding(.trailing, 8)
                                }
                            } else if row > 0 {
                                let number = viewModel.getNumber(row - 1, column)
                                let direction = viewModel.getDirection(row - 1, column)
                                let sector: Sector = .init(
                                    circleRadius: Sizes.sectorRadius,
                                    arrowDirection: direction,
                                    arrowMargin: Sizes.arrowMargin,
                                    number: number,
                                    isInitial: false
                                )
                                SectorView(viewModel: .init(sector: sector))
                            }
                        }
                    }
                }
            }
            
            VStack {
                ForEach(0..<7) { row in
                    HStack {
                        ForEach(0..<5) { column in
                            if row == 0 && column == 0 {
                                
                                HStack(spacing: 16) {
                                    StackedCircles(players: $viewModel.players, size: 40, sector: 30)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                        .scaledToFit()
                                        .shadow(radius: 3)
                                    
                                    Spacer()
                                }
                                
                            } else if row > 0 {
                                let number = viewModel.getNumber(row - 1, column)
                                
                                StackedCircles(players: $viewModel.players, size: 40, sector: number)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    .shadow(radius: 3, x: 3, y: 3)
                            }
                        }
                    }
                }
            }
//            
//            VStack {
//                Spacer()
//                Button("MOVE") {
//                    viewModel.players[0].sector = 10
//                }
//            }
        }
    }
    
    // MARK: - body
    
    var body: some View {
        VStack {
            mainView
        }
    }
}
