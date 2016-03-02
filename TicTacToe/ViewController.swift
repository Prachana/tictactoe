//
//  ViewController.swift
//  TicTacToe
//
//  Created by Rachana Pandey on 11/5/15.
//  Copyright © 2015 anarach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlay = 1;
    
    // game state 
    
    var game = [0,0,0,0,0,0,0,0,0]
    
    var gameActive = true
    
    
    
    let winningCombination =  [[0,1,2], [3,4,5] ,[6,7,8] ,[0,3,6] , [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    
    
    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var playagainButton: UIButton!

    @IBOutlet var button: UIButton!
    
    
    
    
    
    
    @IBAction func buttonPressed(sender: AnyObject)
    {
        if (game[sender.tag] == 0  && gameActive == true)
        {
            game[sender.tag] = activePlay
        
            if activePlay == 1
            {
        
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
            
                activePlay = 2
                
                
            }
        
            else
            {
        
            sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
            activePlay = 1
        
            }
            
            for combination in winningCombination {
             
                if (game[combination[0]] != 0 && game[combination[0]] ==
                    game[combination[1]] && game[combination[1]] ==
                    game[combination[2]])
                {
                    
                    gameActive = false
            
                    if game[combination[0]] == 1
                    {
                    
                        winnerLabel.text = "x has Won"
                    }
                    
                    else
                    {
                        winnerLabel.text = "0 has Won"
                    }
                
                    
                    endGame()
                }
                
                
                
                
            }
            
            if gameActive == true {
            
            gameActive = false
                
            for buttonstate in game{
            
            
                    if buttonstate == 0
                    {
                
                    gameActive = true
                    }
                
                }
            
                    if gameActive == false {
                
                        winnerLabel.text = "It is a draw"
                        endGame()
                        
                }
                
            }
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winnerLabel.hidden = true
        
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 500, winnerLabel.center.y)
        
        
        playagainButton.hidden = true
        
        playagainButton.center = CGPointMake(playagainButton.center.x - 500, playagainButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playAgain(sender: AnyObject) {
        
        
         game = [0,0,0,0,0,0,0,0,0]
        
        activePlay = 1
        
        gameActive = true
        
        winnerLabel.hidden = true
        
        playagainButton.hidden = true
        
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 500, winnerLabel.center.y)
        
        self.playagainButton.center = CGPointMake(playagainButton.center.x - 500, playagainButton.center.y)

        
        
        var buttonTOclear : UIButton
        
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i++ {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
            
        }
        
        
    }
    
    func endGame() {
    
        
        winnerLabel.hidden = false
        playagainButton.hidden = false
        
        UIView.animateWithDuration(1.5, animations: { () -> Void in
            
            self.winnerLabel.center = CGPointMake(self.winnerLabel.center.x + 500, self.winnerLabel.center.y)
            
            self.playagainButton.center = CGPointMake(self.playagainButton.center.x + 500, self.playagainButton.center.y)
        })
        
        
    }
    

}

