//
//  SnakeBodyPart.swift
//  Snake
//
//  Created by Eugene Kiselev on 22.07.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    
    let diameter = 10.0
    init(atPoint point: CGPoint) {
        super.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0,
                                           y: 0,
                                           width: CGFloat(diameter),
                                           height: CGFloat(diameter))).cgPath
        fillColor = .red
        strokeColor = .red
        lineWidth = 5
        self.position = point
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}
