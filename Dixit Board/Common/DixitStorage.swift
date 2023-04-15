//
//  DixitStorage.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 15.04.2023.
//

import Foundation

final class Storage {
    
    static let shared = Storage()
    
    let colors: [String] = (0..<10).map { "color_\($0)" }
}
