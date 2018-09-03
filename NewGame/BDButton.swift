//
//  BDButton.swift
//  SpriteKit Programmatically
//
//  Created by Ilija Mihajlovic on 8/24/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import SpriteKit

class BDButton: SKNode {
    
    var button: SKSpriteNode
    private var mask: SKSpriteNode
    private var cropNode: SKCropNode
    private var action: () -> Void
    var isEnabled = true
    var titleLabel: SKLabelNode? // Because we want to create buttons with and without the label
    
    
    init(imageNamed :String,title: String? = "", buttonAction: @escaping() -> Void) {
        
        button = SKSpriteNode(imageNamed: imageNamed)
        button.size = CGSize(width: 100, height: 100)
       
        titleLabel = SKLabelNode(text: title)
      
        mask = SKSpriteNode(color: SKColor.black, size: button.size)
        mask.alpha = 0
       
        cropNode = SKCropNode()
        cropNode.maskNode = button
        cropNode.zPosition = 3
        cropNode.addChild(mask)
        action = buttonAction
        
        super.init()
        
        //A Boolean value that indicates whether the node receives touch events
        isUserInteractionEnabled = true
        
        setuNodes()
        addNodes()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setuNodes() {
        button.zPosition = 0
        if let titleLabel = titleLabel {
            titleLabel.fontName = "Pacific-Again"
            titleLabel.fontSize = CGFloat.universalFont(size: 30)
            titleLabel.fontColor = SKColor.white
            titleLabel.zPosition = 1
            titleLabel.horizontalAlignmentMode = .center
            titleLabel.verticalAlignmentMode = .center
        }
    }
    
    func addNodes() {
        addChild(button)
        addChild(cropNode)
        
        if let titleLabel = titleLabel {
            addChild(titleLabel)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isEnabled {
            mask.alpha = 0.5
            
            //Scales the button up by an procentage
            run(SKAction.scale(by: 1.05, duration: 0.05))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isEnabled {
            for touch in touches {
                let location: CGPoint = touch.location(in: self)
                
                //if the touch is inside the buttons borders
                if button.contains(location) {
                    mask.alpha = 0.5
                
                } else {
                    mask.alpha = 0.5
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isEnabled {
            for touch in touches {
                let location: CGPoint = touch.location(in: self)
                
                if button.contains(location) {
                    MyAppManager.shared.run(SoundFileName.ClickSound.rawValue, onNode: self)
                    disable()
                    action()
                    run(SKAction.sequence([SKAction.wait(forDuration: 0.2), SKAction.run(self.enable
                        )]))
                }
            }
        }
    }
    
    //Disable the button
    func disable() {
        isEnabled = false
        mask.alpha = 0
        
        //Making the effect that the button is transperent
        button.alpha = 0.5
    }
    
    //Enable the button
    func enable() {
        isEnabled = true
        mask.alpha = 0.0
        button.alpha = 1.0
    }
    
    //Find Font
    func logAvailableFonts() {
        for family: String in UIFont.familyNames {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family) {
                print("**\(names)")
            }
        }
    }
    
    func scaleTo(screenWithPercentage: CGFloat) {
        let aspectRatio = button.size.height / button.size.width
        let screenWidth = ScreenSize.width
        var screenHeight = ScreenSize.heigth
        
        if DeviceType.isiPhoneX {
            screenHeight -= 80
        }
        button.size.width = screenWidth * screenWithPercentage
        button.size.height = button.size.width * aspectRatio
        
    }
    
}














