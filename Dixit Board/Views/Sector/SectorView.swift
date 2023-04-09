//
// SectorView.swift
//

import SwiftUI

struct SectorView: View {
    
    // MARK: - Internal state object var
    
    @ObservedObject var viewModel: SectorViewModel
    
    // MARK: - Internal init
    
    init(viewModel: SectorViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    // MARK: - Internal var
    
    // MARK: - ViewBuilder var
    
    @ViewBuilder private var bodyView: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(viewModel.sector.isInitial ? Color(Colors.initial) : Color(Colors.sector) )
                    .frame(width: viewModel.sector.circleRadius * 2, height: viewModel.sector.circleRadius * 2)

                Text("\(viewModel.sector.number)")
                    .font(.system(size: 25, weight: viewModel.sector.isInitial ? .bold : .regular, design: .default))
                    .foregroundColor(viewModel.sector.isInitial ? .white : Color(Colors.secondary))
                
                StackedCircles(players: viewModel.players, size: viewModel.sector.circleRadius * 1.5)

                Triangle()
                    .fill(Color(Colors.secondary))
                    .frame(width: viewModel.sector.circleRadius/2.75, height: viewModel.sector.circleRadius/2.75)
                    .offset(x: 0, y: -(viewModel.sector.circleRadius + viewModel.sector.arrowMargin + viewModel.sector.circleRadius / 4))
                    .rotationEffect(Angle(degrees: viewModel.sector.arrowDirection.rawValue))
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
            .shadow(color: Color(Colors.shadow), radius: 3, x: 3, y: 3)
        }
    }
    
    // MARK: - body
        
    var body: some View {
        
        bodyView
    }
}
