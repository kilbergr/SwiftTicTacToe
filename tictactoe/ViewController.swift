//
//  ViewController.swift
//  tictactoe
//
//  Created by Rebecca Kilberg on 12/31/15.
//  Copyright © 2015 Rebecca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var oddEven = 1
    var numOfX = 0
    var numOfO = 0
    
    func resetGame() {
         oddEven = 1
         numOfX = 0
         numOfO = 0
         gameStateArr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    
    var gameStateArr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winningCombos = [[0, 1, 2], [0, 3, 6], [0, 4, 8], [3, 4, 5], [6, 7, 8], [2, 4, 6], [1, 4, 7], [2, 5, 8]]
    
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBOutlet weak var onWin: UILabel!
    
    @IBAction func newGameButtonClicked(sender: AnyObject) {
        resetGame()
        newGameButton.setTitle(" ", forState: UIControlState.Normal)
//            for view in self.view.subviews as [UIView] {
//                if let btn = view as? UIButton {
//                    //Removing images
//                    
//                    btn.setImage(UIImage(named: "blue.jpg"), forState: .Normal)
//                }
//            }
        
    }
    
    @IBAction func clickButton(sender: AnyObject) {
        //checking for states of 0, i.e. unclicked
        
        if gameStateArr[sender.tag] == 0 {
            
            if oddEven % 2 != 0 {
                
                sender.setImage(UIImage(named: "x.jpeg"), forState: .Normal)
                
                //keep track of state of each square
                gameStateArr[sender.tag] = 1
                
                numOfX++
                
            }
                
            else {
                
                sender.setImage(UIImage(named: "o.jpg"), forState: .Normal)
                
                //keep track of state of each square
                gameStateArr[sender.tag] = 2
                
                numOfO++

            }
            
            oddEven++
            
            //to check for winning combinations
            if (oddEven >= 3) {
                
                for combo in winningCombos {
                
                    if gameStateArr[combo[0]] != 0 && gameStateArr[combo[0]] == gameStateArr[combo[1]] && gameStateArr[combo[1]] == gameStateArr[combo[2]] {
                       
                        //determine which player won
                        if (oddEven % 2 == 0) {
                            onWin.text = "X Wins!"
                        }
                        
                        else {
                            onWin.text = "O Wins!"
                        }
                    }
                }
            }
        }
        
        //checking to see if board is full
        if numOfO + numOfX == 9 {
            newGameButton.setTitle("New Game!", forState: UIControlState.Normal)
        }
    
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

