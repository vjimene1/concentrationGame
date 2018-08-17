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
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
            if !cards[index].isMatched {
                if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                    //check if cards match
                    if cards[matchIndex].identifier == cards[index].identifier {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                    }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceUpCard = nil
                } else {
                    //either no card or two cards are faceup
                    for flipDownIndex in cards.indices {
                        cards[flipDownIndex].isFaceUp = false
                    }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceUpCard = index
                }
            }

    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        
        //code below shuffles the cards and reassigns them to cards<array>
        
        var shuffledCards = [Card]()
        
        func generateRandomIndex() -> Int {
            let randomIndexShuffleCard = Int(arc4random_uniform(UInt32(cards.count)))
            return randomIndexShuffleCard
        }
        
        while cards.count > 0 {
            let indexGen = generateRandomIndex()
            shuffledCards.append(cards[indexGen])
            cards.remove(at: indexGen)
        }
        
        cards = shuffledCards
        
        
    }
}
