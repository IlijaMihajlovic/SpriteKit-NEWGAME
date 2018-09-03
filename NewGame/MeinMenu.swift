//
//  MeinMenu.swift
//  NewGame
//
//  Created by Ilija Mihajlovic on 9/1/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    
    
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
    
    //MARK: - Label
    var title: SKLabelNode = {
        var label = SKLabelNode(fontNamed: "Pacific-Again")
        label.fontSize = CGFloat.universalFont(size: 40)
        label.zPosition = 2
        label.color = SKColor.white
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.text = "ikacDRKAE"
        return label
    }()
    
    // MARK: - Play Button
    lazy var playButton: BDButton = {
        var button = BDButton(imageNamed: "settingsButton", buttonAction: {
            
        })
        button.scaleTo(screenWithPercentage: 0.33)
        button.zPosition = 1
        return button
    }()
    
    // MARK: - Rate Button
    lazy var rateButtonVar: BDButton = {
        var button = BDButton(imageNamed: "rateButton", buttonAction: {
            
        })
        
        button.scaleTo(screenWithPercentage: 0.22)
        button.zPosition = 1
        return button
    }()
    
    
    // MARK: - Share Button
    lazy var shareButtonVar: BDButton = {
        var button = BDButton(imageNamed: "shareButton", buttonAction: {
            
        })
        button.scaleTo(screenWithPercentage: 0.23)
        button.zPosition = 1
        return button
    }()
    
    
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        setupNodes()
        addNodes()
    }
    
    
    func setupNodes() {
        playButton.position = CGPoint.zero
        playButton.logAvailableFonts()
        title.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * 0.25)
        background.position = CGPoint.zero
        rateButtonVar.position = CGPoint(x: ScreenSize.width * -0.20, y: ScreenSize.heigth * -0.15)
        shareButtonVar.position = CGPoint(x: ScreenSize.width * 0.20, y: ScreenSize.heigth * -0.15)
    }
    
    func addNodes() {
        addChild(playButton)
        addChild(background)
        addChild(title)
        addChild(rateButtonVar)
        addChild(shareButtonVar)
    }
    
 
}
