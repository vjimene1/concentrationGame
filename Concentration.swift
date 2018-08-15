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
        if cards[index].isFaceUp {
            cards[index].isFaceUp=false
        }else{
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        //shuffle the cards for homework
        
    }
}
