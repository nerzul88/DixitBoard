//
// SectorView.swift
//

import SwiftUI

struct SectorView: View {
    
    // MARK: - Internal state object var
    
    @StateObject var viewModel: SectorViewModel
    
    // MARK: - Internal init
    
    init(viewModel: SectorViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Internal var
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(Color.mint)
                    .frame(width: viewModel.circleRadius * 2, height: viewModel.circleRadius * 2)
                
                Text("\(viewModel.number)")
                    .font(.system(size: 32, weight: .regular, design: .default))
                    .foregroundColor(.white)
                
                StackedCircles(colors: viewModel.players, size: viewModel.circleRadius * 1.5)

                Triangle()
                    .fill(Color.red)
                    .frame(width: viewModel.circleRadius/3, height: viewModel.circleRadius/3)
                    .offset(x: 0, y: -(viewModel.circleRadius + viewModel.arrowMargin + viewModel.circleRadius / 4))
                    .rotationEffect(viewModel.arrowDirection)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
        }
    }
}
