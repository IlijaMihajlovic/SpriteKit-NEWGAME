//
//  SettingsScene.swift
//  NewGame
//
//  Created by Ilija Mihajlovic on 9/4/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
// userInteractionEnabled property to true touchesBegan/touchesEnded

import SpriteKit


class SettingsScene: SKScene {
    
    var isPlaying = true
    var musicPlaying = true
    
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
    
    
    let soundButton = SKSpriteNode(color: SKColor.purple, size:CGSize(width: 200, height: 200))
    let soundButton2 = SKSpriteNode(color: SKColor.red, size:CGSize(width: 200, height: 200))

    override func didMove(to view: SKView) {
        print("Inside Settings Scene")
        
     
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        //BackButtonToMainMenu
        backButtonToMainMenu.position = CGPoint(x: ScreenSize.width * -0.37 , y: ScreenSize.heigth * 0.40 )
        addChild(backButtonToMainMenu)
        
        //Background Button
        background.position = CGPoint.zero
        addChild(background)
            
       
        soundButton.name = "button1"
        soundButton2.name = "button2"
        
        soundButton.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * 0.0)
        soundButton2.position = soundButton.position
        soundButton.zPosition = 15
        soundButton2.zPosition = 15
        self.addChild(soundButton)
        
        //soundButton2.position = soundButton.position
        
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        let touch = touches.first
        if let location = touch?.location(in: self){
            let node = atPoint(location)

            
            if node.name == "button1" {
                SKTAudio.sharedInstance().pauseBackgroundMusic()
                node.removeFromParent()
                
                //Not really needed for this example, but a good habit
                if soundButton2.parent == nil {

                    addChild(soundButton2)
                }

            } else if node.name == "button2"{
                SKTAudio.sharedInstance().resumeBackgroundMusic()
                node.removeFromParent()
                
                //Not really needed for this example, but a good habit
                if soundButton.parent == nil {

                    addChild(soundButton)
                }
            }
        }
    }
    
    
   
  }
