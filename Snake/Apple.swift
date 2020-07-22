//
//  Apple.swift
//  Snake
//
//  Created by Eugene Kiselev on 22.07.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import UIKit
import SpriteKit

class Apple: SKShapeNode {
    
    convenience init(position: CGPoint) {
        self.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0,
                                         y: 0,
                                         width: 10,
                                         height: 10)).cgPath
        fillColor = .green
        strokeColor = .green
        lineWidth = 5
        self.position = position
    }
}
