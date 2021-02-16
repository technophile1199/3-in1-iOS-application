//
//  RockPaperViewController.swift
//  Project
//
//  Created by english on 2020-12-02.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit

class RockPaperViewController: UIViewController {
    
    @IBOutlet weak var computerSignLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func chooseRock(_ sender: Any) {
        play(playerSign: .rock)
    }
    @IBAction func choosePaper(_ sender: Any) {
        play(playerSign: .paper)
    }
    @IBAction func chooseScissors(_ sender: Any) {
        play(playerSign: .scissors)
    }
    @IBAction func playAgain(_ sender: Any) {
        updateUI(gameState: .start)
    }
    @IBOutlet var playerChoiceButtons: [UIButton]!
    
    func play(playerSign: Sign) {
        let computerSign = Sign.random()
        let gameState = GameState.getObj(playerSign: playerSign, computerSign: computerSign)
        updateUI(gameState: gameState)
        for button in playerChoiceButtons {
            button.isEnabled = true
            // hide the buttons that the player did not choose
            if button.titleLabel?.text == playerSign.emoji {
                button.isHidden = false
            } else {
                button.isHidden = true
            }
        }
        playAgainButton.isHidden = false
    }
    
    func updateUI(gameState: GameState) {
        gameStatusLabel.text = gameState.text
        if gameState == .start {
           
            playAgainButton.isHidden = true
            for button in playerChoiceButtons {
                button.isEnabled = true
                button.isHidden = false
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
