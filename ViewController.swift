//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Tracy on 8/11/18.
//  Copyright © 2018 VictorInc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
/*
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
*/
    var emojiChoices = ["👻", "🎃", "🍭","👹","👿","💩","💀","👺","🤡"]
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)

    
    // newGame, reinitialize emoji Choices, and then updates view
    @IBAction func newGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
        //flipCount = 0
        emojiChoices = ["👻", "🎃", "🍭","👹","👿","💩","💀","👺","🤡"]
        updateViewFromModel()
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        //flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card not in cardButons")
        }
    }
    
    func updateViewFromModel() {
        flipCountLabel.text = "Flips: \(game.flipCount)"
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            if emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        print(card.identifier)
        return emoji[card.identifier] ?? "?" //return card or if nil return"?"
    }

}
