//
//  ViewController.swift
//  Two Buttonss
//
//  Created by Joshua on 3/2/26.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        label.text = textField.text

    }
 
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        textField.text = ""
        label.text = ""
    }
}

