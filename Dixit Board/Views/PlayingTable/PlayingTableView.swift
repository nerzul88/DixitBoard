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
        HStack {
            
            SectorView(viewModel: .init(sector: .init(circleRadius: Sizes.sectorRadius, arrowDirection: .down, arrowMargin: Sizes.arrowMargin, number: 30, isInitial: true), players: []))
                .frame(width: 50)
            
            Spacer()
            
            stepView
                .frame(height: 50)
                .shadow(color: Color(Colors.shadow), radius: 3, x: 3, y: 3)
        }
    }
    
    
    @ViewBuilder private var mainView: some View {
        VStack {
                        
            HStack {
                VStack(alignment: .leading) {
                    ForEach(0..<6) { id in
                        SectorView(viewModel: .init(sector: .init(circleRadius: Sizes.sectorRadius, arrowDirection: viewModel.getDirection(id), arrowMargin: 7, number: id, isInitial: false), players: []))
                    }
                }
                .frame(width: 66)
                
                
                VStack {
                    ForEach(0..<6) { vid in
                        HStack {
                            ForEach(0..<4) { hid in
                                
                                let sector: Sector = .init(
                                    circleRadius: Sizes.sectorRadius,
                                    arrowDirection: viewModel.getDirection(vid, hid),
                                    arrowMargin: Sizes.arrowMargin,
                                    number: viewModel.getNumber(vid, hid),
                                    isInitial: false
                                )
                                
                                SectorView(viewModel: .init(sector: sector, players: []))
                            }
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

struct Example4_Preview: PreviewProvider {
    static var previews: some View {
        
        PlayingTableView(viewModel: .init())
            .frame(height: 420)
    }
}
