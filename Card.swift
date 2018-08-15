//
//  Card.swift
//  ConcentrationGame
//
//  Created by Tracy on 8/14/18.
//  Copyright © 2018 VictorInc. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    init(identifier:Int) {
        self.identifier = identifier
    }
}
