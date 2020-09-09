//
//  ViewController.swift
//  Lab1
//
//  Created by Blythe Waltman on 9/1/20.
//  Copyright © 2020 Blythe Waltman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fermentTitle: UILabel!
    
    @IBOutlet weak var fermentLogo: UIImageView!
    
    @IBAction func chooseBakers(_ sender: UIButton) {
        if sender.tag == 1{
           fermentLogo.image = UIImage(named : "Image")
            fermentTitle.text = "Andre & Rafa"
           
        }
        else if sender.tag == 2{
            fermentLogo.image = UIImage(named : "Image-2")
            fermentTitle.text = "Classic Sourdough"
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

