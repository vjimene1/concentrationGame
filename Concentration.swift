//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Tracy on 8/14/18.
//  Copyright © 2018 VictorInc. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        
    }
    
    init(numberOfPairsOfCards: Int){
        for identifier in 1...(numberOfPairsOfCards + 1) {
            let card = Card(identifier: identifier)
            cards.append(card)
            cards.append(card)
        }
        
    }
}
