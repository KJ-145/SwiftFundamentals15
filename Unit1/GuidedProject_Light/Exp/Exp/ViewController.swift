//
//  ViewController.swift
//  Exp
//
//  Created by Joshua on 2/13/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func submitTapped(_ sender: UIButton) {
        let name = nameField.text ?? ""
        resultLabel.text = "Hello, \(name)!"
    }

}

