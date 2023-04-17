//
// PlayingTableView.swift
//

import SwiftUI

struct Coordinate {
    var point: CGPoint
    var sector: Int
}

struct PlayingTableView: View {
    
    // MARK: -
    
    @ObservedObject var viewModel: PlayingTableViewModel
    
    @State var coordinates: [Coordinate] = []
    
    // MARK: -
    
    init(viewModel: PlayingTableViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    // MARK: -
    
    @ViewBuilder private var stepView: some View {
        ZStack {
            Capsule()
                .foregroundColor(Color(Colors.actor))
                .addBorder(Color(Colors.main), cornerRadius: Sizes.sectorRadius)
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
                            
                            let number = row == 0 && column == 0 ? 30 : viewModel.getNumber(row - 1, column)
                            
                            let direction = viewModel.getDirection(row - 1, column)
                            let sector: Sector = .init(
                                circleRadius: Sizes.sectorRadius,
                                arrowDirection: direction,
                                arrowMargin: Sizes.arrowMargin,
                                number: number,
                                isInitial: number == 30
                            )
                            
                            ZStack {
                                
                                SectorView(viewModel: .init(sector: sector))
                                    .opacity(row == 0 && column != 0 ? 0 : 1)
                                
                                if row == 0 && column == 0 {
                                    
                                    StackedCircles(players: $viewModel.players, size: Sizes.sectorRadius * 1.5, sector: 30)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                        .shadow(radius: 3)
                                        .opacity(0.5)

                                } else if row > 0 {
                                    let number = viewModel.getNumber(row - 1, column)
                                    
                                    StackedCircles(players: $viewModel.players, size: Sizes.sectorRadius * 1.5, sector: number)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                        .shadow(radius: 3)
                                        .opacity(0.5)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: -
    
    var body: some View {
        VStack {
            mainView
        }
    }
}
