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
    var pairIdentifier = false
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
