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
    
    var flipCount = 0
    
    var score = 0
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        cards[index].pairIdentifier = true //Working on score
        print(cards[index].pairIdentifier) //Working on score
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                flipCount += 1 // iterates flipCount
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
                flipCount += 1 // iterates flipCount
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
        
        while cards.count > 0 {
            //let indexGen = generateRandomIndex()
            let indexGen = Int(arc4random_uniform(UInt32(cards.count)))
            shuffledCards.append(cards[indexGen])
            cards.remove(at: indexGen)
        }
        cards = shuffledCards
        
        
    }
}
