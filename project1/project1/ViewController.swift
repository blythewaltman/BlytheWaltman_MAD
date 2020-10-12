//
//  ViewController.swift
//  project1
//
//  Created by Blythe Waltman on 10/10/20.
//  Copyright © 2020 Blythe Waltman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helperImage: UIImageView!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var instructionImage: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var prevBTN: UIBarButtonItem!
    @IBOutlet weak var nextBTN: UIBarButtonItem!
    
    var stepNumber: Int = 0
    var resetStep: Int = 0
    
    /* variables for timer*/
    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    @IBAction func startButtonTapped(_ sender: Any) {
        if isTimerRunning == false{
                   runTimer()
        }
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        if self.resumeTapped == false{
            timer.invalidate()
            self.resumeTapped = true
            self.pauseButton.setTitle("Resume",for: .normal)
        }
        else{
            runTimer()
            self.resumeTapped = false
            self.pauseButton.setTitle("Pause",for: .normal)
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        timer.invalidate()
        resetStep = stepNumber - 1
        if(resetStep == 1){
            seconds = 10800
        }
        else if(resetStep == 2 || resetStep == 12){
            seconds = 3600
        }
        else if(resetStep == 3 || resetStep == 4 || resetStep == 5 || resetStep == 7){
            seconds = 1800
        }
        else if(resetStep == 6){
            seconds = 7200
        }
        else if(resetStep == 8){
            seconds = 50400
        }
        else if(resetStep == 9){
            seconds = 5400
        }
        else if(resetStep == 10 || resetStep == 11){
            seconds = 1200
        }
        else{
            seconds = 0
        }
        
        timerLabel.text = timeString(time: TimeInterval(seconds))
        isTimerRunning = false
    }
    
    func runTimer(){ //initializes the timer, timerInterval: how often the method will be called, selector: the method being called
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats:true)
        isTimerRunning = true
    }
    
    @objc func updateTimer(){
        if seconds < 1{
            timer.invalidate()
        }
        else{
        seconds -= 1
        timerLabel.text = timeString(time: TimeInterval(seconds)) // send it throught the timeString method to format it first
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        print("stepNumber is " + String(stepNumber))
        if(stepNumber == 0){
                    self.startButton.setTitle("Start",for: .normal)
                    self.pauseButton.setTitle("Pause",for: .normal)
                    self.resetButton.setTitle("Reset",for: .normal)
                    timerLabel.text = "03:00:00"
                    helperImage.image = UIImage(named: "img2")
                    instructionImage.image = UIImage(named: "inst2")
                    stepLabel.text = "Step 1: Feed the Starter"
                    stepNumber = stepNumber + 1
                    print("now stepNumber is " + String(stepNumber))
                    timer.invalidate()
                    seconds = 10800
                    timerLabel.text = timeString(time: TimeInterval(seconds))
                    isTimerRunning = false
                       
                }
                else if(stepNumber == 1){
                    helperImage.image = UIImage(named: "img3")
                    instructionImage.image = UIImage(named: "inst3")
                    stepLabel.text = "Step 2: Autolyse Phase"
                    stepNumber = stepNumber + 1
                    print("now stepNumber is " + String(stepNumber))
                    timer.invalidate()
                    seconds = 3600
                    timerLabel.text = timeString(time: TimeInterval(seconds))
                    isTimerRunning = false
                }
                else if(stepNumber == 2){
                    helperImage.image = UIImage(named: "img4")
                    instructionImage.image = UIImage(named: "inst4")
                    stepLabel.text = "Step 3: Bulk Fermentation"
                    stepNumber = stepNumber + 1
                    print("now stepNumber is " + String(stepNumber))
                    timer.invalidate()
                    seconds = 1800
                    timerLabel.text = timeString(time: TimeInterval(seconds))
                    isTimerRunning = false
                }
                else if(stepNumber == 3){
                    helperImage.image = UIImage(named: "img5")
                    instructionImage.image = UIImage(named: "inst5")
                    stepLabel.text = "Step 4: Last Ingredient"
                    stepNumber = stepNumber + 1
                    timer.invalidate()
                    seconds = 1800
                    timerLabel.text = timeString(time: TimeInterval(seconds))
                    isTimerRunning = false
                }
                else if(stepNumber == 4){
                    helperImage.image = UIImage(named: "img6")
                    instructionImage.image = UIImage(named: "inst6")
                    stepLabel.text = "Step 5: Strengthen"
                    stepNumber = stepNumber + 1
                    timer.invalidate()
                    seconds = 1800
                    timerLabel.text = timeString(time: TimeInterval(seconds))
                    isTimerRunning = false
                }
                else if(stepNumber == 5){
                    helperImage.image = UIImage(named: "img7")
                    instructionImage.image = UIImage(named: "inst7")
                    stepLabel.text = "Step 6: Let it Rest"
                    stepNumber = stepNumber + 1
                    timer.invalidate()
                    seconds = 7200
                    timerLabel.text = timeString(time: TimeInterval(seconds))
                    isTimerRunning = false
                }
                else if(stepNumber == 6){
                    helperImage.image = UIImage(named: "img8")
                    instructionImage.image = UIImage(named: "inst8")
                    stepLabel.text = "Step 7: Preshape"
                    stepNumber = stepNumber + 1
                    timer.invalidate()
                    seconds = 1800
                    timerLabel.text = timeString(time: TimeInterval(seconds))
                    isTimerRunning = false
                }
                else if(stepNumber == 7){
                    helperImage.image = UIImage(named: "img9")
                    instructionImage.image = UIImage(named: "inst9")
                    stepLabel.text = "Step 8: Final Shaping"
                    stepNumber = stepNumber + 1
                    timer.invalidate()
                    seconds = 50400
                    timerLabel.text = timeString(time: TimeInterval(seconds))
                    isTimerRunning = false
                }
                else if(stepNumber == 8){
                    helperImage.image = UIImage(named: "img10")
                    instructionImage.image = UIImage(named: "inst10")
                    stepLabel.text = "Step 9: The Next Morning"
                    stepNumber = stepNumber + 1
                    timer.invalidate()
                    seconds = 5400
                    timerLabel.text = timeString(time: TimeInterval(seconds))
                    isTimerRunning = false
                }
                else if(stepNumber == 9){
                    helperImage.image = UIImage(named: "img11")
                    instructionImage.image = UIImage(named: "inst11")
                    stepLabel.text = "Step 10: Bake Part One"
                    stepNumber = stepNumber + 1
                    timer.invalidate()
                    seconds = 1200
                    timerLabel.text = timeString(time: TimeInterval(seconds))
                    isTimerRunning = false
                }
                else if(stepNumber == 10){
                    helperImage.image = UIImage(named: "img12")
                    instructionImage.image = UIImage(named: "inst12")
                    stepLabel.text = "Step 11: Bake Part Two"
                    stepNumber = stepNumber + 1
                    timer.invalidate()
                    seconds = 1200
                    timerLabel.text = timeString(time: TimeInterval(seconds))
                    isTimerRunning = false
                    
                }
                else if(stepNumber == 11){
                    helperImage.image = UIImage(named: "img13")
                    instructionImage.image = UIImage(named: "inst13")
                    stepLabel.text = "Step 12: Cool & Enjoy"
                    timer.invalidate()
                    stepNumber = stepNumber + 1
                    seconds = 3600
                    timerLabel.text = timeString(time: TimeInterval(seconds))
                    isTimerRunning = false
                }
    }
    
    
    @IBAction func prevButtonTapped(_ sender: Any) {
        print("stepNumber is " + String(stepNumber))
        if(stepNumber == 1){
            print("changing to step 0")
            self.startButton.setTitle("",for: .normal)
            self.pauseButton.setTitle("",for: .normal)
            self.resetButton.setTitle("",for: .normal)
            timerLabel.text = ""
            helperImage.image = UIImage(named: "img1")
            instructionImage.image = UIImage(named: "inst1")
            stepLabel.text = "Ingredients & Tools"
            stepNumber = stepNumber - 1
            print("now stepNumber is " + String(stepNumber))
            timer.invalidate()
        }
        else if(stepNumber == 2){
            print("changing to step 1")
            timerLabel.text = "03:00:00"
            helperImage.image = UIImage(named: "img2")
            instructionImage.image = UIImage(named: "inst2")
            stepLabel.text = "Step 1: Feed the Starter"
            stepNumber = stepNumber - 1
            print("now stepNumber is " + String(stepNumber))
            timer.invalidate()
            seconds = 10800
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
        else if(stepNumber == 3){
            print("changing to step 1")
            helperImage.image = UIImage(named: "img3")
            instructionImage.image = UIImage(named: "inst3")
            stepLabel.text = "Step 2: Autolyse Phase"
            stepNumber = stepNumber - 1
            print("now stepNumber is " + String(stepNumber))
            timer.invalidate()
            seconds = 3600
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
            isTimerRunning = false
        }
        else if(stepNumber == 4){
            helperImage.image = UIImage(named: "img4")
            instructionImage.image = UIImage(named: "inst4")
            stepLabel.text = "Step 3: Bulk Fermentation"
            stepNumber = stepNumber - 1
            print("now stepNumber is " + String(stepNumber))
            timer.invalidate()
            seconds = 1800
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
        else if(stepNumber == 5){
            helperImage.image = UIImage(named: "img5")
            instructionImage.image = UIImage(named: "inst5")
            stepLabel.text = "Step 4: Last Ingredient"
            stepNumber = stepNumber - 1
            timer.invalidate()
            seconds = 1800
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
        else if(stepNumber == 6){
            helperImage.image = UIImage(named: "img6")
            instructionImage.image = UIImage(named: "inst6")
            stepLabel.text = "Step 5: Strengthen"
            stepNumber = stepNumber - 1
            timer.invalidate()
            seconds = 1800
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
        else if(stepNumber == 7){
            helperImage.image = UIImage(named: "img7")
            instructionImage.image = UIImage(named: "inst7")
            stepLabel.text = "Step 6: Let it Rest"
            stepNumber = stepNumber - 1
            timer.invalidate()
            seconds = 7200
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
        else if(stepNumber == 8){
            helperImage.image = UIImage(named: "img8")
            instructionImage.image = UIImage(named: "inst8")
            stepLabel.text = "Step 7: Preshape"
            stepNumber = stepNumber - 1
            timer.invalidate()
            seconds = 1800
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
        else if(stepNumber == 9){
            helperImage.image = UIImage(named: "img9")
            instructionImage.image = UIImage(named: "inst9")
            stepLabel.text = "Step 8: Final Shaping"
            stepNumber = stepNumber - 1
            timer.invalidate()
            seconds = 50400
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
        else if(stepNumber == 10){
            helperImage.image = UIImage(named: "img10")
            instructionImage.image = UIImage(named: "inst10")
            stepLabel.text = "Step 9: The Next Morning"
            stepNumber = stepNumber - 1
            timer.invalidate()
            seconds = 5400
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
        else if(stepNumber == 11){
            helperImage.image = UIImage(named: "img11")
            instructionImage.image = UIImage(named: "inst11")
            stepLabel.text = "Step 10: Bake Part One"
            stepNumber = stepNumber - 1
            timer.invalidate()
            seconds = 1200
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
        else if(stepNumber == 12){
            helperImage.image = UIImage(named: "img12")
            instructionImage.image = UIImage(named: "inst12")
            stepLabel.text = "Step 11: Bake Part Two"
            stepNumber = stepNumber - 1
            timer.invalidate()
            seconds = 1200
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
        else if(stepNumber == 13){
            helperImage.image = UIImage(named: "img13")
            instructionImage.image = UIImage(named: "inst13")
            stepLabel.text = "Step 12: Cool & Enjoy"
            timer.invalidate()
            stepNumber = stepNumber - 1
            seconds = 3600
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

