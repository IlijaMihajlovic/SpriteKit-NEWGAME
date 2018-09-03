//
//  GameplayScene.swift
//  NewGame
//
//  Created by Ilija Mihajlovic on 9/1/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import SpriteKit

class GameplayScene: SKScene {
    
    var background: SKSpriteNode = {
        var sprite = SKSpriteNode(imageNamed: "backgroundImage")
        
        if DeviceType.isiPad || DeviceType.isiPadPro {
            sprite.sclaleTo(screenWithPercentage: 1.0)
            
        } else {
            sprite.scaleTo(screenHeightPercentage: 1.0)
        }
        
        sprite.zPosition = 0
        return sprite
    }()
    
    
    var score = 0
    lazy var scoreLabel: SKLabelNode = {
        var label = SKLabelNode(fontNamed: "Pacific-Again")
        label.fontSize = CGFloat.universalFont(size: 40)
        label.zPosition = 3
        label.fontColor = SKColor.black
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.text = String(score)
        return label
    }()
    
    override func didMove(to view: SKView) {
        print("Inside Gameplay Scene")
        setupNodes()
        addNewDonuts()
        addNodes()
        
    }
    
    func setupNodes() {
        background.position = CGPoint(x: ScreenSize.width * 0.5, y: ScreenSize.heigth * 0.5)
        scoreLabel.position = CGPoint(x: ScreenSize.width * 0.5, y: ScreenSize.heigth * 0.9)
    }

    func addNodes() {
        addChild(background)
        addChild(scoreLabel)
    }
    
    //Start new game
    func startNewBoard() {
        removeAllDonuts()
        addNewDonuts()
    }
    
    func addNewDonuts() {
        
        //Get random images on screen
        for _ in 0...8{
            
            let imageNamed = "donut\(arc4random_uniform(3) + 1).png"
            //let imageNamed = "donut\(Int(CGFloat.random(1.0, max: 4)))"
            
            let donut = BDButton(imageNamed: imageNamed) {
                print("Wrong donut tapped")
                self.handleWrongDonutTapped()
            }
            donut.scaleTo(screenWithPercentage: CGFloat.random(0.20, max: 0.45))
            donut.zPosition = 1
            
            //donut.position = CGPoint(x: ScreenSize.width * 0.5, y: ScreenSize.heigth * 0.5)
            
            donut.position = CGPoint(x: ScreenSize.width * CGFloat.random(0.1, max: 0.8), y: ScreenSize.heigth * CGFloat.random(0.1, max: 0.8))
            
            addChild(donut)
            
        }
        
        let imageNamed2 = "donut\(arc4random_uniform(3) + 1).png"
        let winnerDonut = BDButton(imageNamed: imageNamed2) {
            print("Winnder Donut  tapped")
            self.handleWinnerDonutTapped()
            
        }
        
        winnerDonut.scaleTo(screenWithPercentage: 0.6)
        winnerDonut.name = "donut"
        winnerDonut.zPosition = 2
        winnerDonut.position = CGPoint(x: ScreenSize.width * CGFloat.random(0.1, max: 0.7), y: ScreenSize.heigth * CGFloat.random(0.1, max: 0.7))
        addChild(winnerDonut)
        
    }
    
    func removeAllDonuts() {
        enumerateChildNodes(withName: "//*") { (node, stop) in
            if node.name == "donut" {
                node.removeFromParent()
            }
        }
    }
    
    
    func handleWinnerDonutTapped() {
        score += 1
        updateScoreLabel()
        startNewBoard()
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "\(score)"
    }
    
    //Go to GameOver scene
    func handleWrongDonutTapped() {
        MyAppPlayerStats.shared.setScore(score)
        MyAppManager.shared.transiton(self, toScene: .GameOver, transition: SKTransition.moveIn(with: .right, duration: 0.5))
    }
    
}










