//
//  ViewController.swift
//  timerTest
//
//  Created by Blythe Waltman on 9/26/20.
//  Copyright © 2020 Blythe Waltman. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var OurTimer = Timer()
    var TimerDisplayed = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func startBTN(_ sender: Any) {
        OurTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseBTN(_ sender: Any) {
        OurTimer.invalidate()
    }
    
    @IBAction func resetBTN(_ sender: Any) {
        OurTimer.invalidate()
        TimerDisplayed = 0
        label.text = "0"
    }
    
    @objc func Action(){
        TimerDisplayed += 1
        label.text = String(TimerDisplayed)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

