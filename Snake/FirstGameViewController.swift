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
    
}
