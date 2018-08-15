//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Tracy on 8/11/18.
//  Copyright © 2018 VictorInc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }

    }
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    var emojiChoices = ["👻", "🎃", "👻", "🎃"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            print(sender)
            
        } else {
            print("chosen card not in cardButons")
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
    }
}

