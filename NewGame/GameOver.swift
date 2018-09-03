//
//  GameOver.swift
//  NewGame
//
//  Created by Ilija Mihajlovic on 9/1/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import SpriteKit
import StoreKit

class GameOver: SKScene {
    
    //MARK: - Background
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
    
    var title: SKLabelNode = {
        var label = SKLabelNode(fontNamed: "Pacific-Again")
        label.fontSize = CGFloat.universalFont(size: 40)
        label.zPosition = 2
        label.color = SKColor.cyan
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.text = "Game Over Scene"
        
        return label
    }()
    
    //MARK: - Score
    var score: SKLabelNode = {
        var label = SKLabelNode(fontNamed: "Pacific-Again")
        label.fontSize = CGFloat.universalFont(size: 34)
        label.zPosition = 2
        label.color = SKColor.black
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.text = "Score: \(MyAppPlayerStats.shared.getScore())"
        return label
    }()
    
    //MARK: - Best Score
    var bestScore: SKLabelNode = {
        var label = SKLabelNode(fontNamed: "Pacific-Again")
        label.fontSize = CGFloat.universalFont(size:29)
        label.zPosition = 2
        label.color = SKColor.black
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.text = "Best Score: \(MyAppPlayerStats.shared.getBestScore())"
        return label
    }()
    
    
    //MARK: Back Button
    lazy var backButtonVar: BDButton = {
        var button = BDButton(imageNamed: "backButton", title: "", buttonAction: {
           
            MyAppManager.shared.transiton(self, toScene: .MainMenu, transition: SKTransition.moveIn(with: .up, duration: 0.5))
        })
        button.zPosition = 1
        button.scaleTo(screenWithPercentage: 0.19)
        return button
    }()
    
    //MARK: - Replay Button
    lazy var replayButtonVar: BDButton = {
        var button = BDButton(imageNamed: "replayButton", title: "", buttonAction: {
            
       MyAppManager.shared.transiton(self, toScene: .GameplayScene, transition: SKTransition.moveIn(with: .up, duration: 0.5))
        })
        button.scaleTo(screenWithPercentage: 0.25)
        button.zPosition = 1
        return button
    }()
    
    
    override func didMove(to view: SKView) {
        print("Inside Game Over Scene")
        SKStoreReviewController.requestReview()
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        setupNodes()
        addNodes()
    }
    
    func setupNodes() {
        background.position = CGPoint.zero
        title.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * 0.25)
        score.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * 0.14)
        bestScore.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * -0.14)
        backButtonVar.position = CGPoint(x: ScreenSize.width * -0.36 , y: ScreenSize.heigth * 0.40)
        replayButtonVar.position = CGPoint(x: ScreenSize.heigth * 0.0, y: -0.10)
        
    }
    
    func addNodes() {
        addChild(background)
        addChild(title)
        addChild(score)
        addChild(bestScore)
        addChild(backButtonVar)
        addChild(replayButtonVar)
    }
}















