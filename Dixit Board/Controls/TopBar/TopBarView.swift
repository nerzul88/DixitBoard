//
// TopBarView.swift
//

import SwiftUI

struct TopBarView: View {
    
    // MARK: -
    
    @ObservedObject var viewModel: TopBarViewModel
    
    // MARK: -
    
    init(viewModel: TopBarViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    // MARK: - 
        
    @ViewBuilder private var topBar: some View {
        
        ZStack {
            Color.clear
                .background(
                    RoundedCornersShape(
                        corners: [.bottomLeft, .bottomRight],
                        radius: 48
                    )
                    .fill(Color(Colors.actor))
                )
            
            HStack {
                Button(action: { viewModel.onTapMenu?() }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(Colors.main))
                    
                }
                
                Image("dixit-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                                
                Button(action: { viewModel.onTapClose?() }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(Colors.main))
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 8)
            .padding(.top, 48)
            .shadow(color: .black.opacity(0.25), radius: 50, x: 0, y: 15)
            
        }
        .frame(height: 100)
    }
    
    // MARK: -

    var body: some View {
        topBar
            .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 10)
    }
}
