//
//  ViewController.swift
//  playgame
//
//  Created by MEI KU on 2017/8/9.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//

import UIKit
import AVFoundation
import GameplayKit

class ViewController: UIViewController {
    
    let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 3)
    
    @IBOutlet weak var pointLabel: UILabel!
    
    
    
    @IBOutlet weak var gamestatusLabel: UILabel!
    
    @IBOutlet weak var playagainButton: UIButton!
    
    @IBOutlet weak var upButton: UIButton!
    
    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var downButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    
    @IBAction func tagupButton(_ sender: UIButton) {
        if randomChoice.nextInt() == 0 {
            opponentImage.image = UIImage(named:"up")
            update(gameState:.win)
            
        }
        
        else if randomChoice.nextInt() == 1 {
            opponentImage.image = UIImage(named:"down")
            update(gameState: .draw)
            
        }
        
        else if randomChoice.nextInt() == 2 {
            opponentImage.image = UIImage(named:"left")
            update(gameState: .draw)
            
        }
        else {
            opponentImage.image = UIImage(named:"right")
            update(gameState: .draw)
            
        }
        
        leftButton.isHidden = true
        rightButton.isHidden = true
        downButton.isHidden = true
        playagainButton.isHidden = false
    }
    
    @IBAction func tagleftButton(_ sender: UIButton) {
        
        if randomChoice.nextInt() == 0 {
            opponentImage.image = UIImage(named:"up")
            update(gameState:.draw)
            
        }
            
        else if randomChoice.nextInt() == 1 {
            opponentImage.image = UIImage(named:"down")
            update(gameState: .draw)
            
        }
            
        else if randomChoice.nextInt() == 2 {
            opponentImage.image = UIImage(named:"left")
            update(gameState:.win)
            
        }
        else {
            opponentImage.image = UIImage(named:"right")
            update(gameState: .draw)
            
        }
        
        upButton.isHidden = true
        rightButton.isHidden = true
        downButton.isHidden = true
        playagainButton.isHidden = false
    }
    
    
    @IBAction func tagdownButton(_ sender: UIButton) {
        if randomChoice.nextInt() == 0 {
            opponentImage.image = UIImage(named:"up")
            update(gameState:.draw)
            
        }
            
        else if randomChoice.nextInt() == 1 {
            opponentImage.image = UIImage(named:"down")
            update(gameState: .win)
            
        }
            
        else if randomChoice.nextInt() == 2 {
            opponentImage.image = UIImage(named:"left")
            update(gameState: .draw)
            
        }
        else {
            opponentImage.image = UIImage(named:"right")
            update(gameState: .draw)
            
        }
        
        upButton.isHidden = true
        rightButton.isHidden = true
        leftButton.isHidden = true
        playagainButton.isHidden = false
    }
        
        
    @IBAction func tagrigthButton(_ sender: UIButton) {
        
        if randomChoice.nextInt() == 0 {
            opponentImage.image = UIImage(named:"up")
            update(gameState:.draw)
            
        }
            
        else if randomChoice.nextInt() == 1 {
            opponentImage.image = UIImage(named:"down")
            update(gameState: .draw)
            
        }
            
        else if randomChoice.nextInt() == 2 {
            opponentImage.image = UIImage(named:"left")
            update(gameState: .draw)
            
        }
        else {
            opponentImage.image = UIImage(named:"right")
            update(gameState: .win)
            
        }
        
        upButton.isHidden = true
        downButton.isHidden = true
        leftButton.isHidden = true
        playagainButton.isHidden = false
        
    }
    
    
    
    
    
    @IBOutlet weak var opponentImage: UIImageView!
    
    
    
    @IBAction func playagainButton(_ sender: UIButton) {
        
        update(gameState: .start)
        upButton.isHidden = false
        downButton.isHidden = false
        leftButton.isHidden = false
        rightButton.isHidden = false
        playagainButton.isHidden = true
    }
    
    
    
    var winPoint:Int = 0
    var drawPoint:Int = 0
    
    func update(gameState: GameState) {
        
        gamestatusLabel.text = gameState.status
        switch gameState {
        case .start:
            view.backgroundColor = #colorLiteral(red: 0.6487160218, green: 0.9100599009, blue: 1, alpha: 1)
            let speechUtterance =  AVSpeechUtterance(string: "黑白配,男生女生配")
            speechUtterance.voice = AVSpeechSynthesisVoice(language:"zh-TW")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
             opponentImage.image = UIImage(named:"base")
            
        case .win:
            view.backgroundColor = #colorLiteral(red: 0.574222358, green: 0.8862745166, blue: 0.6728555015, alpha: 1)
            
            winPoint = winPoint + 10
            
       pointLabel.text = "得分: \(winPoint), 沒中: \(drawPoint)"
            
            
        case .draw:
            view.backgroundColor = #colorLiteral(red: 1, green: 0.8083013433, blue: 0.8348716025, alpha: 1)
            
            drawPoint = drawPoint + 1
            
            pointLabel.text = "得分: \(winPoint), 沒中: \(drawPoint)"
            
        }
        playagainButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update(gameState: .start)
        upButton.isHidden = false
        downButton.isHidden = false
        leftButton.isHidden = false
        rightButton.isHidden = false
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

