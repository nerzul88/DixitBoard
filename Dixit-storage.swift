//
//  Dixit-storage.swift
//  Dixit Board
//
//  Created by Андрей Рыбалкин on 15.04.2023.
//

import Foundation

final class Storage {
    
    static let shared = Storage()
    
    let colors: [DXColor] = (0..<10).map { DXColor(color: .init("color_\($0)")) }
}
