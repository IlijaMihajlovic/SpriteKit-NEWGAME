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
    
    
    //MARK: - Settings Button
   lazy var settingsButon: BDButton = {
        var button = BDButton(imageNamed: "settingsButton", buttonAction: {
            
            MyAppManager.shared.transiton(self, toScene: .SettingsScene, transition: SKTransition.moveIn(with: .down ,duration: 0.4))
        })
    button.zPosition = 1
    button.scaleTo(screenWithPercentage: 0.18)
       return button
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
        var button = BDButton(imageNamed: "playButton", buttonAction: {
            
        MyAppManager.shared.transiton(self, toScene: .GameplayScene, transition: SKTransition.moveIn(with: .right, duration: 0.5))
            
        })
        button.scaleTo(screenWithPercentage: 0.33)
        button.zPosition = 1
        return button
    }()
    
    // MARK: - Rate Button
    lazy var rateButtonVar: BDButton = {
        var button = BDButton(imageNamed: "rateButton", buttonAction: {
            
            //Rate the game one the app store
            if let url = URL(string: "https://itenes.apple.com/app/id\(AppId)?actionwrite-review/") {
                UIApplication.shared.open(url, options: [:], completionHandler: { (result) in
                    
                    if result {
                        print("Success")
                    } else {
                        print("Failed")
                    }
                })
            }
        })
        
        button.scaleTo(screenWithPercentage: 0.22)
        button.zPosition = 1
        return button
    }()
    
    
    // MARK: - Share Button
    lazy var shareButtonVar: BDButton = {
        var button = BDButton(imageNamed: "shareButton", buttonAction: {
            
             MyAppManager.shared.share(on: self, text: "Love This Game? Shere it with your freinds and family!", image: UIImage(named: "shareButton"), excludeActivityTypes: [.airDrop])
            
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
        rateButtonVar.position = CGPoint(x: ScreenSize.width * -0.30, y: ScreenSize.heigth * -0.14)
        shareButtonVar.position = CGPoint(x: ScreenSize.width * 0.30, y: ScreenSize.heigth * -0.15)
        settingsButon.position = CGPoint(x: ScreenSize.width * -0.37 , y: ScreenSize.heigth * 0.40 )
    }
    
    func addNodes() {
        addChild(playButton)
        addChild(background)
        addChild(title)
        addChild(rateButtonVar)
        addChild(shareButtonVar)
        addChild(settingsButon)
    }
    
 
}
