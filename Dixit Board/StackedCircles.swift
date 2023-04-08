//
//  StackedCircles.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 08.04.2023.
//

import SwiftUI

struct StackedCircles: View {
    
    @State var colors: [Color]
    @State var size: CGFloat
    
    init(colors: [Color], size: CGFloat) {
        self.colors = colors
        self.size = size
    }

    var body: some View {
        ZStack {
            ForEach(0..<colors.count, id: \.self) { index in
                Circle()
                    .foregroundColor(self.colors[index])
                    .frame(width: size, height: size)
                    .offset(y: CGFloat(-index * (Int(size) / 5) ))
                    .shadow(radius: 5)
            }
        }
    }
}
