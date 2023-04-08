//
//  Triangle.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 08.04.2023.
//

import SwiftUI

public struct Triangle: Shape {
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

