//
//  GameScene.swift
//  Snake
//
//  Created by Eugene Kiselev on 22.07.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var snake: Snake?
    
    override func didMove(to view: SKView) {
        
        sceneCreate(for: view)
        buttonCreate(for: view)
        appleCreate()
        addSnake(for: view)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else { return }
            touchedNode.fillColor = .white
            
            if touchedNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockwise()
            } else if touchedNode.name == "clockwiseButton" {
                snake!.moveClockwise()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else { return }
            touchedNode.fillColor = .white
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
    
        snake!.move()
    }
}

extension GameScene {
    
    func sceneCreate(for view: SKView) {
        
        backgroundColor = .white
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = false
        view.showsPhysics = true
    }
    
    func buttonCreate(for view: SKView) {
        let counterClockwiseButton = SKShapeNode()
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0,
                                                                  y: 0,
                                                                  width: 45,
                                                                  height: 45)).cgPath
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX + 30,
                                                  y: view.scene!.frame.minY + 30)
        counterClockwiseButton.fillColor = .black
        counterClockwiseButton.strokeColor = .black
        counterClockwiseButton.lineWidth = 5
        counterClockwiseButton.name = "counterClockwiseButton"
        self.addChild(counterClockwiseButton)

        let clockwiseButton = SKShapeNode()
        clockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0,
                                                           y: 0,
                                                           width: 45,
                                                           height: 45)).cgPath
        clockwiseButton.position = CGPoint(x: view.scene!.frame.maxX - 80,
                                           y: view.scene!.frame.minY + 30)
        clockwiseButton.fillColor = .black
        clockwiseButton.strokeColor = .black
        clockwiseButton.lineWidth = 5
        clockwiseButton.name = "clockwiseButton"
        self.addChild(clockwiseButton)
    }
    
    func appleCreate() {
        
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 5)) + 1)
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 5)) + 1)
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        self.addChild(apple)
    }
    
    func addSnake(for view: SKView) {
        
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX,
                                       y: view.scene!.frame.midY))
        self.addChild(snake!)
    }
}
