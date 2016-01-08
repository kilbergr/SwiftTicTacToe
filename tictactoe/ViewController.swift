//
//  ViewController.swift
//  tictactoe
//
//  Created by Rebecca Kilberg on 12/31/15.
//  Copyright © 2015 Rebecca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameStateArr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winningCombos = [[0, 1, 2], [0, 3, 6], [0, 4, 8], [3, 4, 5], [6, 7, 8], [2, 4, 6], [1, 4, 7], [2, 5, 8]]
    
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBOutlet weak var onWin: UILabel!
    
    //if xOdd is one, it's for Xs, if 2, it's for Os
    var xOdd = 1
    var xoCount = 0
    
    
    func resetGame() {
        xOdd = 1
        gameStateArr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        onWin.hidden = true
        xoCount = 0
    }
    
    @IBAction func newGameButtonClicked(sender: AnyObject) {
        resetGame()
        newGameButton.setTitle(" ", forState: UIControlState.Normal)
        
        var buttonToClear : UIButton
        for i in 0..<9 {
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
            
        }

        
    }
    
    @IBAction func clickButton(sender: AnyObject) {
        //checking for states of 0, i.e. unclicked
       
            if gameStateArr[sender.tag] == 0 {
                
                if xOdd == 1 {
                    
                    sender.setImage(UIImage(named: "x.jpeg"), forState: .Normal)
                    
                    //keep track of state of each square
                    gameStateArr[sender.tag] = 1
                    
                    xOdd = 2
                    xoCount++
                }
                    
                else {
                    
                    sender.setImage(UIImage(named: "o.jpg"), forState: .Normal)
                    
                    //keep track of state of each square
                    gameStateArr[sender.tag] = 2
                    
                    xOdd = 1
                    xoCount++

                }
                
                //to check for winning combinations
                for combo in winningCombos {
                
                    if gameStateArr[combo[0]] != 0 && gameStateArr[combo[0]] == gameStateArr[combo[1]] && gameStateArr[combo[1]] == gameStateArr[combo[2]] {
                       
                        //determine which player won
                        if (xOdd % 2 == 0) {
                            onWin.text = "X Wins!"
                            showWinner()
                            offerNew()
                        }
                        
                        else {
                            onWin.text = "O Wins!"
                            showWinner()
                            offerNew()
                        }
                    }
                    
                    //if there's a draw
                    else {
                        if xoCount > 8 {
                            print(gameStateArr[combo[0]], gameStateArr[combo[1]], gameStateArr[combo[2]])
                            onWin.text = "It's a Draw!"
                            offerNew()
                            showWinner()
                            
                        }
                    }
            }
        }
    }
    
    func offerNew() {
        //show and animate new game option
        newGameButton.setTitle("New Game!", forState: UIControlState.Normal)
        
        UIView.animateWithDuration(0.7, animations: { () -> Void in
            
            self.newGameButton.center = CGPointMake(self.newGameButton.center.x + 400, self.newGameButton.center.y)
        })

    }
    
    func showWinner() {
        //show and animate label
        onWin.hidden = false
        
        UIView.animateWithDuration(0.7, animations: { () -> Void in
            
            self.onWin.center = CGPointMake(self.onWin.center.x + 400, self.onWin.center.y)
        })

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onWin.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

