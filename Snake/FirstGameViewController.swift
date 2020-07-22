//
//  FirstGameViewController.swift
//  Snake
//
//  Created by Eugene Kiselev on 22.07.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import UIKit

class FirstGameViewController: UIViewController {

    @IBAction func juniorButton(_ sender: UIButton) {
        
        GameViewController.moveSpeed = 150
    }
    
    @IBAction func middleButton(_ sender: UIButton) {
        
        GameViewController.moveSpeed = 300
    }
    
    @IBAction func seniorButton(_ sender: UIButton) {
        
        GameViewController.moveSpeed = 450
    }
    
    @IBAction func infoButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "How to play?", message: """
Use the right side of the screen to turn right.
Use the left side of the screen to turn left.
""", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
