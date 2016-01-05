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
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBAction func newGameButtonClicked(sender: AnyObject) {
        newGameButton.setTitle(" ", forState: UIControlState.Normal)
        
    }
    
    
    @IBAction func clickButton(sender: AnyObject) {
        //checking for an empty (unclicked) image
        if  sender.imageView!!.image == nil {
            if oddEven % 2 != 0 {
                sender.setImage(UIImage(named: "x.jpeg"), forState: .Normal)
                numOfX++
            }
            else {
                sender.setImage(UIImage(named: "o.jpg"), forState: .Normal)
                numOfO++
            }
            oddEven++
        }
        //checking to see if board is full
        if numOfO + numOfX == 9 {
            newGameButton.setTitle("New Game!", forState: UIControlState.Normal)
        }
    
    }

    
   
    func allFilled(sender:UIButton!){
       
        if button.imageView?.image != nil {
            print("Try again")
        }
    }
    
    func buttonAction(sender:UIButton!) {
        let btnsendtag:UIButton = sender
        if btnsendtag.tag == 1 {
            print("button1")
        }
        if btnsendtag.tag == 2 {
            print("button2")
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

