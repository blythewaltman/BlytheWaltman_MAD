//
//  ViewController.swift
//  project1
//
//  Created by Blythe Waltman on 10/10/20.
//  Copyright © 2020 Blythe Waltman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var instructionImage: UIImageView!
    @IBOutlet weak var helperImage: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var prevBTN: UIBarButtonItem!
    @IBOutlet weak var nextBTN: UIBarButtonItem!
    
    /* Variable for keeping track of what step we are on*/
    var stepNumber: Int = 0 //Originally the step number starts off as 0 (Ingredients & Tools)
    
    //Help for the timer came from https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f
    /* variables for timer*/
    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false //Resume tapped starts as false
    
    @IBAction func startButtonTapped(_ sender: Any) {
        if isTimerRunning == false{ //Check that the timer isn't already running
            runTimer()
        }
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        if self.resumeTapped == false{ //If resume hasn't been tapped yet stop the timer and set resume tapped to true
            timer.invalidate()
            self.resumeTapped = true
            self.pauseButton.setTitle("Resume",for: .normal) //Set button to say resume
        }
        else{ //If this case is true then the user has already paused the timer and wants to resume it
            runTimer()
            self.resumeTapped = false
            self.pauseButton.setTitle("Pause",for: .normal) //Set button to say pause
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        timer.invalidate() //Stop the timer
        
        /* Depending on what step we are on we will need to reset the time to the correct number of seconds*/
        if(stepNumber == 1){
            seconds = 2 //This time would really be 10800 but for test purposes of the alert it is set to 2 seconds
        }
        else if(stepNumber == 2 || stepNumber == 12){
            seconds = 3600
        }
        else if(stepNumber == 3 || stepNumber == 4 || stepNumber == 5 || stepNumber == 7){
            seconds = 1800
        }
        else if(stepNumber == 6){
            seconds = 7200
        }
        else if(stepNumber == 8){
            seconds = 50400
        }
        else if(stepNumber == 9){
            seconds = 5400
        }
        else if(stepNumber == 10 || stepNumber == 11){
            seconds = 1200
        }
        else{
            seconds = 0
        }
        
        timerLabel.text = timeString(time: TimeInterval(seconds)) //Convert the time to a string of hours:minutes:seconds
        isTimerRunning = false
    }
    
    func runTimer(){ //initializes the timer, timerInterval: how often the method will be called, selector: the method being called
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats:true)
        isTimerRunning = true
    }
    
    @objc func updateTimer(){
        if seconds < 1{ //Check if the timer has run out
            timer.invalidate() //If it has stop it and send an alert to the user
            //create a UIAlertController object
            let alert = UIAlertController(title:"Attention", message: "Time is up!", preferredStyle: UIAlertController.Style.alert)
            //create a UIAlertAction object for the button
            let cancelAction = UIAlertAction(title: "Close", style:UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert,animated: true, completion: nil)
        }
        else{ //If the timer hasn't run out, continue to subtract seconds and update the displayed time
        seconds -= 1
        timerLabel.text = timeString(time: TimeInterval(seconds)) // send it throught the timeString method to format it first
        }
    }
    
    /* Function to convert the seconds into a string of hours:minutes:seconds*/
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    /* Function that is called any time the next button in the tool bar is tapped*/
    @IBAction func nextButtonTapped(_ sender: Any) {
        if(stepNumber == 0){ //If the step number is 0 then we are displaying the Ingredients & Tools and want to move on to step 1
            self.startButton.setTitle("Start",for: .normal) //Make the start button visible
            self.pauseButton.setTitle("Pause",for: .normal) //Make the Pause button visibile
            self.resetButton.setTitle("Reset",for: .normal) //Make the Reset button visible
            helperImage.image = UIImage(named: "img2") //Change the helper image to the next image
            instructionImage.image = UIImage(named: "inst2") //Change the instruction image to the next image
            stepLabel.text = "Step 1: Feed the Starter" // Change the step label at the top to display the correct step
            stepNumber = stepNumber + 1 //Advance the step number to now be 1
            timer.invalidate() //Stop the timer if it was previously running
            seconds = 2 //This time would really be 10800 but for test purposes of the alert it is set to 2 seconds
            timerLabel.text = timeString(time: TimeInterval(seconds)) //Change the display for the clock
            isTimerRunning = false //Make the timer running be false since it is no longer running
        }
        else if(stepNumber == 1){
            helperImage.image = UIImage(named: "img3")
            instructionImage.image = UIImage(named: "inst3")
            stepLabel.text = "Step 2: Autolyse Phase"
            stepNumber = stepNumber + 1
            timer.invalidate()
            seconds =  3600
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
        else if(stepNumber == 2){
            helperImage.image = UIImage(named: "img4")
            instructionImage.image = UIImage(named: "inst4")
            stepLabel.text = "Step 3: Bulk Fermentation"
            stepNumber = stepNumber + 1
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
        if(stepNumber == 1){
            self.startButton.setTitle("",for: .normal)
            self.pauseButton.setTitle("",for: .normal)
            self.resetButton.setTitle("",for: .normal)
            timerLabel.text = ""
            helperImage.image = UIImage(named: "img1")
            instructionImage.image = UIImage(named: "inst1")
            stepLabel.text = "Ingredients & Tools"
            stepNumber = stepNumber - 1
            timer.invalidate()
        }
        else if(stepNumber == 2){
            timerLabel.text = "03:00:00"
            helperImage.image = UIImage(named: "img2")
            instructionImage.image = UIImage(named: "inst2")
            stepLabel.text = "Step 1: Feed the Starter"
            stepNumber = stepNumber - 1
            timer.invalidate()
            seconds = 10800
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
        else if(stepNumber == 3){
            helperImage.image = UIImage(named: "img3")
            instructionImage.image = UIImage(named: "inst3")
            stepLabel.text = "Step 2: Autolyse Phase"
            stepNumber = stepNumber - 1
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

