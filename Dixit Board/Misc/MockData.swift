//
//  MockData.swift
//  Dixit Board
//
//  Created by Андрей Рыбалкин on 09.04.2023.
//

import Foundation
import UIKit

final class MockData {
    
    static let palyers: [Player] = [
        
        Player(name: "Михаил", color: .init(color: UIColor.red), number: 1, position: 0, isActive: true),
        Player(name: "Дарья", color: .init(color: UIColor.green), number: 2, position: 0, isActive: true),
        Player(name: "Платон", color: .init(color: UIColor.blue), number: 3, position: 2, isActive: true),
        Player(name: "Тимофей", color: .init(color: UIColor.cyan), number: 4, position: 5, isActive: true),
        Player(name: "Егор", color: .init(color: UIColor.yellow), number: 5, position: 5, isActive: true),
        Player(name: "София", color: .init(color: UIColor.magenta), number: 6, position: 28, isActive: true),
        Player(name: "Александр", color: .init(color: UIColor.orange), number: 7, position: 28, isActive: true),
        Player(name: "Константин", color: .init(color: UIColor.purple), number: 8, position: 26, isActive: true),
        Player(name: "Александра", color: .init(color: UIColor.brown), number: 9, position: 30, isActive: true),
        Player(name: "Виктория", color: .init(color: .accentColor), number: 10, position: 18, isActive: true),

    ]
    
    static let sectorPlayers: [Player] = [
        
        Player(name: "Егор", color: .init(color: UIColor.yellow), number: 5, position: 0, isActive: true),
        Player(name: "София", color: .init(color: UIColor.magenta), number: 6, position: 27, isActive: true),
        Player(name: "Александр", color: .init(color: UIColor.orange), number: 7, position: 27, isActive: true),
    ]

}






















