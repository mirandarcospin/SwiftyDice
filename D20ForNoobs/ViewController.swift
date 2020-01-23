//
//  ViewController.swift
//  D20ForNoobs
//
//  Created by Miranda Ramirez Cospin on 1/21/20.
//  Copyright © 2020 Miranda Ramirez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet weak var criticalLabel: UILabel!
    
    var rollySounds: AVAudioPlayer?
    var failSounds: AVAudioPlayer?
    var winnySounds: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //which sounds to play
        let path = Bundle.main.path(forResource: "rolldice.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            rollySounds = try AVAudioPlayer(contentsOf: url)
            rollySounds?.play()
        } catch {
            // couldn't load file :(
        }
        
        let fpath = Bundle.main.path(forResource: "failwah.mp3", ofType:nil)!
        let furl = URL(fileURLWithPath: fpath)
        do {
            failSounds = try AVAudioPlayer(contentsOf: furl)
            failSounds?.play()
        } catch {
            // couldn't load file :(
        }
        
        let wpath = Bundle.main.path(forResource: "torpedo.mp3", ofType:nil)!
        let wurl = URL(fileURLWithPath: wpath)
        do {
            winnySounds = try AVAudioPlayer(contentsOf: wurl)
            winnySounds?.play()
        } catch {
            // couldn't load file :(
        }
        
        print("we launched the dice...")
    }

    func rollDice() {
        let rolledNumber = Int.random(in: 1...20)
        
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
        rollySounds?.play()
        
        if(imageName == "d1") {
            criticalLabel.text = "That is too bad"
            criticalLabel.isHidden = false
            failSounds?.play()
        }
        else if(imageName == "d20") {
            criticalLabel.text = "You are amazing"
            criticalLabel.isHidden = false
            winnySounds?.play()
        }
        else {
            criticalLabel.isHidden = true
        }
    }
    
    override func motionEnded (_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    
    @IBAction func rollDiceFromButton() {
        rollDice()
    }
    
}

