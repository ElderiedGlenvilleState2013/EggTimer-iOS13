//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes  = ["Soft": 5, "Medium" : 7, "Hard" : 12]
    var totalTime = 0
    var secondPassed  = 0
    var timer = Timer()
    var player = AVAudioPlayer()
    @IBOutlet weak var timerLabel : UILabel!
    @IBOutlet weak var timerProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timerProgressView.progress = 0
    }



    @objc func updateCounter() {
        //example functionality
        if secondPassed < totalTime {
            
            secondPassed += 1
            timerProgressView.progress = Float(secondPassed ) / Float(totalTime)
             
        } else {
            timer.invalidate()
            timerLabel.text = "Done"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()

        }
        
        
    }
    
    
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle
        timer.invalidate()
        print(eggTimes[hardness!])
        totalTime = eggTimes[hardness!]!
        timerProgressView.progress = 0
        secondPassed = 0
        timerLabel.text = hardness
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
       
       
       
    }
    
    
    
}
