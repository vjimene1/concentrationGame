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
    
    func flipTracker(cardIndex: Int) {
        for matches in cards.indices { //checking second card has been flipped before
            if matches != cardIndex, cards[matches].identifier == cards[cardIndex].identifier{
                if cards[matches].cardHasBeenFlipped == true, cards[cardIndex].cardHasBeenFlipped == true {
                    score -= 1
                }
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                flipCount += 1 // iterates flipCount
                //check if cards match
                /*
                for matches in cards.indices { //checking first card has been flipped before
                    if matches != matchIndex, cards[matches].identifier == cards[matchIndex].identifier{
                        if cards[matches].cardHasBeenFlipped == true, cards[matchIndex].cardHasBeenFlipped == true {
                            score -= 1
                        }
                    }
                }
                for matches in cards.indices { //checking second card has been flipped before
                    if matches != index, cards[matches].identifier == cards[index].identifier{
                        if cards[matches].cardHasBeenFlipped == true, cards[index].cardHasBeenFlipped == true {
                            score -= 1
                        }
                    }
                }
                */
                flipTracker(cardIndex: matchIndex)
                flipTracker(cardIndex: index)
                cards[matchIndex].cardHasBeenFlipped = true
                cards[index].cardHasBeenFlipped = true
                
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                    // enter a line of code to check if card partner has previously been flipped up
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no card or two cards are faceup
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                if indexOfOneAndOnlyFaceUpCard == nil {
                    flipCount += 1 // iterates flipCount
                }
                cards[index].isFaceUp = true
                //cards[index].pairIdentifier = true
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
        
        while cards.count > 0 {
            //let indexGen = generateRandomIndex()
            let indexGen = Int(arc4random_uniform(UInt32(cards.count)))
            shuffledCards.append(cards[indexGen])
            cards.remove(at: indexGen)
        }
        cards = shuffledCards
        
        
    }
}
