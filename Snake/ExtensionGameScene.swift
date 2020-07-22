//
//  ExtensionGameScene.swift
//  Snake
//
//  Created by Eugene Kiselev on 22.07.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import SpriteKit
import GameplayKit

extension GameScene: SKPhysicsContactDelegate {
    
    func sceneCreate(for view: SKView) {
        
        backgroundColor = .white
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = false
        view.showsPhysics = true
    }
    
    func buttonCreate(for view: SKView) {
        let counterClockwiseButton = SKShapeNode()
        counterClockwiseButton.path = UIBezierPath(rect: CGRect(x: 0,
                                                                y: 0,
                                                                width: frame.size.width / 2,
                                                                height: frame.size.height)).cgPath
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX,
                                                  y: view.scene!.frame.minY)
        counterClockwiseButton.fillColor = .white
        counterClockwiseButton.strokeColor = .white
        counterClockwiseButton.lineWidth = 1
        counterClockwiseButton.name = "counterClockwiseButton"
        self.addChild(counterClockwiseButton)
        
        let clockwiseButton = SKShapeNode()
        clockwiseButton.path = UIBezierPath(rect: CGRect(x: 0,
                                                           y: 0,
                                                           width: frame.size.width / 2,
                                                           height: frame.size.height)).cgPath
        clockwiseButton.position = CGPoint(x: view.scene!.frame.maxX - frame.size.width / 2,
                                           y: view.scene!.frame.minY)
        clockwiseButton.fillColor = .white
        clockwiseButton.strokeColor = .white
        clockwiseButton.lineWidth = 1
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
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let collisionObject = bodyes ^ CollisionCategories.SnakeHead
        switch collisionObject {
        case CollisionCategories.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            snake?.addBodyPart()
            apple?.removeFromParent()
            appleCreate()
            
            // MARK: Home Work. Lesson 8.
        // Проверяем, что это стена экрана:
        case CollisionCategories.EdgeBody:
            // Удаляем змейку:
            snake?.removeFromParent()
            // Добавляем змейку:
            addSnake(for: view!)
        default:
            break
        }
    }
}
