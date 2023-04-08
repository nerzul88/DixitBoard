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
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(Color.mint)
                    .frame(width: viewModel.sector.circleRadius * 2, height: viewModel.sector.circleRadius * 2)
                
                Text("\(viewModel.sector.number)")
                    .font(.system(size: 32, weight: .regular, design: .default))
                    .foregroundColor(.white)
                
                StackedCircles(players: viewModel.players, size: viewModel.sector.circleRadius * 1.5)

                Triangle()
                    .fill(Color.red)
                    .frame(width: viewModel.sector.circleRadius/3, height: viewModel.sector.circleRadius/3)
                    .offset(x: 0, y: -(viewModel.sector.circleRadius + viewModel.sector.arrowMargin + viewModel.sector.circleRadius / 4))
                    .rotationEffect(Angle(degrees: viewModel.sector.arrowDirection))
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
        }
    }
}
