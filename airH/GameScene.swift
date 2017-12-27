//
//  GameScene.swift
//  airH
//
//  Created by Robert on 25/12/17.
//  Copyright © 2017 Robert González. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var disk = SKSpriteNode()
    var playerOne = SKSpriteNode()
    var playerTwo = SKSpriteNode()
    
    var playerOneLabel = SKLabelNode()
    var playerTwoLabel = SKLabelNode()

    var score = [Int]()
    
    
    override func didMove(to view: SKView) {
        
        startGame()
        
        disk = self.childNode(withName: "disk") as! SKSpriteNode
        playerOne = self.childNode(withName: "playerOne") as! SKSpriteNode
        playerOne.position.y = (-self.frame.height / 2) + 50

        playerTwo = self.childNode(withName: "playerTwo") as! SKSpriteNode
        playerTwo.position.y = (self.frame.height / 2) - 50
        
        playerOneLabel = self.childNode(withName: "playerOneLabel") as! SKLabelNode
        
        playerTwoLabel = self.childNode(withName: "playerTwoLabel") as! SKLabelNode
        
        


        disk.physicsBody?.applyImpulse(CGVector(dx: -75, dy: -75))
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border

        
    }
    
    
    func startGame(){
    
    score = [0,0]
        
        playerOneLabel.text = "\(score[0])"
        
        playerTwoLabel.text = "\(score[1])"

    }
    
    func addScore(playerWhoWon: SKSpriteNode){
        
        disk.position = CGPoint(x: 0, y: 0)
        disk.physicsBody?.velocity = CGVector(dx: 0, dy: 0)

    
        if playerWhoWon == playerOne{
            score[0] += 1
            disk.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
            
            disk.physicsBody?.applyImpulse(CGVector(dx: -75, dy: -75))

        
        } else if playerWhoWon == playerTwo {
            score[1] += 1
            disk.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
            disk.physicsBody?.applyImpulse(CGVector(dx: 75, dy: 75))


        }
    
        print(score)
        playerOneLabel.text = "\(score[0])"
        
        playerTwoLabel.text = "\(score[1])"


    }
    
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
        
            let location = touch.location(in: self)
            
            playerOne.run(SKAction.moveTo(x: location.x, duration: 0.2))
        
        }
        
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            playerOne.run(SKAction.moveTo(x: location.x, duration: 0.2))
            
        }

    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        playerTwo.run(SKAction.moveTo(x: disk.position.x, duration: 1.0))
        
        if disk.position.y <= playerOne.position.y - 20 {
        
            addScore(playerWhoWon: playerTwo)
        
        }else if disk.position.y >= playerTwo.position.y + 20 {
        
            addScore(playerWhoWon: playerOne)
        
        }
        
        
    }
}






