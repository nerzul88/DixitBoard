//
// TopBarView.swift
//

import SwiftUI

struct TopBarView: View {
    
    // MARK: - Internal state object var
    
    @ObservedObject var viewModel: TopBarViewModel
    
    // MARK: - Internal init
    
    init(viewModel: TopBarViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    // MARK: - Internal var
    
    var onTapMenu: (() -> Void)?
    var onTapClose: (() -> Void)?
    
    @ViewBuilder private var topBar: some View {
        
        ZStack {
            Color.clear
                .background(
                    RoundedCornersShape(
                        corners: [.bottomLeft, .bottomRight],
                        radius: 48
                    )
                    .fill(Color.white)
                )
            
            HStack {
                Button(action: { self.onTapMenu?() }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .fontWeight(.bold)
                        .tint(.accentColor)
                }
                                
                Text("Dixit game".uppercased())
                    .font(.system(size: 35, weight: .bold, design: .default))
                    .foregroundColor(.accentColor)
                    .frame(maxWidth: .infinity)
                                
                Button(action: { self.onTapClose?() }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
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
            .shadow(color: .black.opacity(0.25), radius: 50, x: 0, y: 15)
    }
}

// MARK: -

struct Example3_Preview: PreviewProvider {
    static var previews: some View {
        ZStack {
            TopBarView(viewModel: .init())
        }
    }
}
