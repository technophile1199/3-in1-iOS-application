//
//  tictoe.swift
//  Project
//
//  Created by english on 2020-12-01.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit

class tictoe: UIViewController {
    
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winningCoomb = [[0,1,2],[3,4,5],[6,7,8] ,[0,3,6] , [1,4,7] , [2,5,8] , [0,4,8] , [2,4,6]]
    var gameIsActive = true
    
    @IBOutlet var lbl: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    
    
    @IBAction func btn(_ sender: UIButton)
    {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)
            {
                gameState[sender.tag-1] = activePlayer
                if (activePlayer == 1)
                {
                    sender.setImage(UIImage(named: "images.png"), for: UIControl.State())
                    activePlayer = 2
                }
                else
                {
                    sender.setImage(UIImage(named: "circle.png"), for: UIControl.State())
                    activePlayer = 1
                }
            }
            
            for combination in winningCoomb
            {
               if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] &&
                    gameState[combination[1]] ==
                    gameState[combination[2]]
                    {
                        gameIsActive = false
                        
                        if gameState[combination[0]] == 1
                        {
                            //cross one
                            lbl.text = "CROSS IS WINNER"
                        }
                        else{
                            lbl.text = "NOUGHT IS WINNER"
                        }
                        
                        playAgainButton.isHidden = false
                        lbl.isHidden = false
                        
                    }
            
        }
            gameIsActive = false
            
        for i in gameState
        {
            if i == 0
            {
               gameIsActive = true
                break
            }
            }
            
            if gameIsActive == false
            {
                lbl.text = "IT WAS a DRAW"
                lbl.isHidden = true
                playAgainButton.isHidden = false
            }
    }
    
    @IBAction func playAgain(_ sender: UIButton)
    {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        lbl.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
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

