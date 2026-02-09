//
//  ViewController.swift
//  Light
//
//  Created by Joshua on 2/8/26.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true
    
    @IBOutlet weak var lightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    fileprivate func updateUI() {
        //lightOn.toggle()
        if lightOn {
            view.backgroundColor = .white
          //  lightButton.setTitle("On", for: .normal)

        } else {
            view.backgroundColor = .black
          //  lightButton.setTitle("On", for: .normal)
        }
    }

    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
        
    }
   
}

 
