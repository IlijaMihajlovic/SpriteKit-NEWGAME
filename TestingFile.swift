//
//  TestingFile.swift
//  NewGame
//
//  Created by Ilija Mihajlovic on 9/5/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//


import SpriteKit

class TestingFile: SKScene {
    
    var isPlaying: Bool = true
    var musicPlaying: Bool = true
    
    lazy var musicButton: BDButton = {
        
        if isPlaying {
            var button = BDButton(imageNamed: "playButton2", buttonAction: {
                SKTAudio.sharedInstance().pauseBackgroundMusic()
            })
            button.zPosition = 1
            button.scaleTo(screenWithPercentage: 0.10)
            isPlaying = false
            button.removeFromParent()
            return button
            
        } else {
            
            var button = BDButton(imageNamed: "pauseButton", buttonAction: {
                
                if self.musicPlaying == false {
                    
                    SKTAudio.sharedInstance().resumeBackgroundMusic()
                    
                    
                } else if self.musicPlaying == true{
                    
                    SKTAudio.sharedInstance().pauseBackgroundMusic()
                    
                    
                }
            })
            button.zPosition = 1
            button.scaleTo(screenWithPercentage: 0.10)
            isPlaying = true
            button.removeFromParent()
            return button
        }
        
    }()
    
    
    /////////////////////////////////
    var buttonPlay = SKSpriteNode(imageNamed: "playButton")
    var buttonStop = SKSpriteNode()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                
                let location = touch.location(in: buttonPlay)
                
                if buttonPlay.contains(location) {
                    print("Button Tapped")
                    //buttonPlay.removeFromParent()
                    buttonPlay = SKSpriteNode(imageNamed: "stopMusicButton")
                   // addChild(buttonPlay)
                }
            }
        }
    }
    
    
    //touchesMoved- if button does not contain touch, change texture back.
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPlay = SKSpriteNode(imageNamed: "stopMusicButton")
        
    }
    
    //touchesEnded- if touch stayed within button during touchesMoved, change texture back.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                let location = touch.location(in: buttonPlay)
                
                if buttonPlay.contains(location) {
                    
                    buttonPlay = SKSpriteNode(fileNamed: "buttonPlay")!
                }
            }
        }
    }
    
    
    ///////////////////////////////
    
    
    
    
    
    
    
}
