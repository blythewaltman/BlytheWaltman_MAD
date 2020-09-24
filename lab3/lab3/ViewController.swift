//
//  ViewController.swift
//  lab3
//
//  Created by Blythe Waltman on 9/22/20.
//  Copyright © 2020 Blythe Waltman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var youLabel: UILabel!
    @IBOutlet weak var youImage: UIImageView!
    @IBOutlet weak var youControl: UISegmentedControl!
    
    @IBOutlet weak var sidekickLabel: UILabel!
    @IBOutlet weak var sidekickImage: UIImageView!
    @IBOutlet weak var sidekickControl: UISegmentedControl!
    
    @IBOutlet weak var capitalSwitch: UISwitch!
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    

    func updateYou(){
        if youControl.selectedSegmentIndex==0{
            youLabel.text = "Katniss"
            youImage.image = UIImage(named:"katniss")
        }
        else if youControl.selectedSegmentIndex==1{
            youLabel.text = "Jack Sparrow"
            youImage.image = UIImage(named:"jackSparrow")
        }
    }
    
    func updateSidekick(){
        if sidekickControl.selectedSegmentIndex==0{
            sidekickLabel.text = "Dr. Watson"
            sidekickImage.image = UIImage(named:"drWatson")
        }
        else if sidekickControl.selectedSegmentIndex==1{
            sidekickLabel.text = "Ron Weasley"
            sidekickImage.image = UIImage(named:"ron")
        }
    }
    
    func updateCaps(){
        if capitalSwitch.isOn{
            youLabel.text = youLabel.text?.uppercased()
            youLabel.font = UIFont.italicSystemFont(ofSize: 20.0)
            sidekickLabel.text = sidekickLabel.text?.uppercased()
            sidekickLabel.font = UIFont.italicSystemFont(ofSize: 20.0)
            
        }
        else{
            youLabel.text = youLabel.text?.lowercased()
            sidekickLabel.text = sidekickLabel.text?.lowercased()
            youLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
            sidekickLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        }
    }
    
    @IBAction func changeYou(_ sender: UISegmentedControl) {
        updateYou()
        updateCaps()
    }
    
    @IBAction func sidekickChange(_ sender: UISegmentedControl) {
       updateSidekick()
       updateCaps()
    }
    
    @IBAction func updateFont(_ sender: UISwitch) {
        updateCaps()
 
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize = sender.value
        fontSizeLabel.text = String(format: "%.0f", fontSize)
        let fontSizeCGFloat = CGFloat(fontSize)
        youLabel.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
        sidekickLabel.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

