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
        for matches in cards.indices { //checking if card has been flipped before
            if matches != cardIndex, cards[matches].identifier == cards[cardIndex].identifier, cards[matches].cardHasBeenFlipped == true, cards[cardIndex].cardHasBeenFlipped == true {
                score -= 1
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                flipCount += 1 // iterates flipCount
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                    // check if cards have been flipped and deduct score
                }else{
                    flipTracker(cardIndex: matchIndex) //checks if first flipped card has been flipped before
                    flipTracker(cardIndex: index) //checks if second card has been flipped before
                    cards[matchIndex].cardHasBeenFlipped = true
                    cards[index].cardHasBeenFlipped = true
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
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    // MARK: Initialize number of pairs of Cards
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
