//
//  MockData.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 09.04.2023.
//

import Foundation
import UIKit

final class MockData {
    
    static let players: [Player] = [
        
        Player(name: "Михаил",      color: Colors.color_0, number: 1, sector: 0, position: .zero),
        Player(name: "Дарья",       color: Colors.color_1, number: 2, sector: 0, position: .zero),
        Player(name: "Платон",      color: Colors.color_2, number: 3, sector: 2, position: .zero),
        Player(name: "Тимофей",     color: Colors.color_3, number: 4, sector: 5, position: .zero),
        Player(name: "Егор",        color: Colors.color_4, number: 5, sector: 5, position: .zero),
        Player(name: "София",       color: Colors.color_5, number: 6, sector: 30, position: .zero),
        Player(name: "Александр",   color: Colors.color_6, number: 7, sector: 30, position: .zero),
        Player(name: "Константин",  color: Colors.color_7, number: 8, sector: 30, position: .zero),
        Player(name: "Александра",  color: Colors.color_8, number: 9, sector: 30, position: .zero),
        Player(name: "Виктория",    color: Colors.color_9, number: 10, sector: 30, position: .zero),
    ]
    
}
