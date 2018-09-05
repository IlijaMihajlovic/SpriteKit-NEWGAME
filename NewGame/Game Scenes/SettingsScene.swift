//
//  SettingsScene.swift
//  NewGame
//
//  Created by Ilija Mihajlovic on 9/4/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
// userInteractionEnabled property to true touchesBegan/touchesEnded

import SpriteKit


class SettingsScene: SKScene {
    
    
    
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
    
    
    //MARK: - Back Button
    lazy var backButtonToMainMenu: BDButton = {
        var button = BDButton(imageNamed: "backButton2", buttonAction: {
            
            MyAppManager.shared.transiton(self, toScene: .MainMenu, transition: SKTransition.moveIn(with: .left, duration: 0.5))
        })
        button.zPosition = 1
        button.scaleTo(screenWithPercentage: 0.18)
        return button
    }()
    
    
    
    
    
    //MARK: - Stop Music Button
    
//    lazy var playMusicButton: BDButton = {
//        var button = BDButton(imageNamed: "playButton", buttonAction: {
//        })
//        button.zPosition = 4
//        button.scaleTo(screenWithPercentage: 0.10)
//        button.name = "play"
//        return button
//    }()
    
    lazy var playMusicButton: SKSpriteNode = {
        var button = SKSpriteNode(imageNamed: "playButton")
        button.zPosition = 4
        button.scaleTo(screenHeightPercentage: 0.18)
        button.sclaleTo(screenWithPercentage: 0.18)
        button.name = "play"
        
        return button
    }()
    
    
    lazy var pauseMusicButton: SKSpriteNode = {
        var button = SKSpriteNode(imageNamed: "pauseButton")
        button.zPosition = 4
        button.scaleTo(screenHeightPercentage: 0.24)
        button.sclaleTo(screenWithPercentage: 0.24)
        button.name = "pause"
        
        return button
    }()
    
//    lazy var pauseMusicButton: BDButton = {
//        var button = BDButton(imageNamed: "pauseButton", buttonAction: {
//        })
//        button.zPosition = 4
//        button.scaleTo(screenWithPercentage: 0.10)
//        button.name = "pause"
//        return button
//    }()
    
    override func didMove(to view: SKView) {
        print("Inside Settings Scene")
        
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        //BackButtonToMainMenu
        backButtonToMainMenu.position = CGPoint(x: ScreenSize.width * -0.37 , y: ScreenSize.heigth * 0.40 )
        addChild(backButtonToMainMenu)
        
        //Background Button
        background.position = CGPoint.zero
        addChild(background)
        
        
        playMusicButton.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * 0.0)
        pauseMusicButton.position = playMusicButton.position
        self.addChild(playMusicButton)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self){
            let node = atPoint(location)
            
            
            if node.name == "play" {
                SKTAudio.sharedInstance().pauseBackgroundMusic()
                node.removeFromParent()
                
                //Not really needed for this example, but a good habit
                if pauseMusicButton.parent == nil {
                    
                    addChild(pauseMusicButton)
                }
                
            } else if node.name == "pause" {
                SKTAudio.sharedInstance().resumeBackgroundMusic()
                node.removeFromParent()
                
                //Not really needed for this example, but a good habit
                if playMusicButton.parent == nil {
                    
                    addChild(playMusicButton)
                }
            }
        }
    }
    
    
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

            let touch = touches.first
            if let location = touch?.location(in: self){
                let node = atPoint(location)


                if node.name == "play" {
                    SKTAudio.sharedInstance().pauseBackgroundMusic()
                    node.removeFromParent()

                    //Not really needed for this example, but a good habit
                    if pauseMusicButton.parent == nil {

                        addChild(pauseMusicButton)
                    }

                } else if node.name == "pause" {
                    SKTAudio.sharedInstance().resumeBackgroundMusic()
                    node.removeFromParent()

                    //Not really needed for this example, but a good habit
                    if playMusicButton.parent == nil {

                        addChild(playMusicButton)
                    }
                }
            }
        }
    
    
    
}
