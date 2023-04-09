//
//  Size.swift
//  Dixit Board
//
//  Created by Андрей Рыбалкин on 09.04.2023.
//

import Foundation
import UIKit

final class Sizes {
    
    static var sectorRadius: CGFloat {
        return UIScreen.main.bounds.width / 15.5
    }
    
    static var arrowMargin: CGFloat {
        return Sizes.sectorRadius / 5
    }

}
