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
        
    // MARK: - ViewBuilder var
    
    @ViewBuilder private var bodyView: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(viewModel.sector.isInitial ? Color(Colors.actorSecondary) : Color(Colors.actor) )
                    .frame(width: viewModel.sector.circleRadius * 2, height: viewModel.sector.circleRadius * 2)
                    .addBorder(Color(Colors.main), cornerRadius: viewModel.sector.circleRadius)

                Text("\(viewModel.sector.number)")
                    .font(.system(size: 25, weight: viewModel.sector.isInitial ? .bold : .regular, design: .default))
                    .foregroundColor(viewModel.sector.isInitial ? .white : Color(Colors.main))
                
                Triangle()
                    .fill(Color(Colors.main))
                    .frame(width: Sizes.arrowSize, height: Sizes.arrowSize)
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
