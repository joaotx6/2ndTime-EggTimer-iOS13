//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var countDownLabel: UILabel!
    
    var totalTime = 60
    var secondsRemaining = 0
    var timer = Timer()
    let eggTimes = ["Soft": 2, "Medium": 7, "Hard": 12]
    
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        topLabel.text = "Making \(sender.currentTitle!) eggs."
        timer.invalidate()
        countDownLabel.text = ""
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countTimer), userInfo: nil, repeats: true)
        
        slider.maximumValue = Float(secondsRemaining)
//        var progress =
//        slider.setValue(Float(progress), animated: true)

    }
    
    @objc func countTimer() {
        
        if secondsRemaining > -1 {
            print("\(secondsRemaining)")
            countDownLabel.text = "\(secondsRemaining)"
            secondsRemaining -= 1

        } else {
            print("Done")
            topLabel.text = "Done!"
            timer.invalidate()
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        topLabel.text = "How do you like your eggs?"
        countDownLabel.text = ""
        timer.invalidate()
        slider.value = 0.0
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)
        {
            sender.alpha = 1.0
        }
    }
    
}




//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("No button pressed")
//        }

//        if sender.currentTitle == "Soft" {
//            print(softTime)
//        } else if sender.currentTitle == "Medium" {
//            print(mediumTime)
//        } else {
//            print(hardTime)
//        }

