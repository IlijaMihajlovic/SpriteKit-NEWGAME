//
//  ButtonFile.swift
//  NewGame
//
//  Created by Ilija Mihajlovic on 9/5/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene: SKScene{
    
    let soundButton = SKSpriteNode(color: SKColor.purple, size:CGSize(width: 200, height: 200))
    let soundButton2 = SKSpriteNode(color: SKColor.red, size:CGSize(width: 200, height: 200))
    
    override func didMoveToView(view: SKView) {
        
        
        soundButton.name = "button1"
        soundButton2.name = "button2"
        
        soundButton.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * 0.0)
        soundButton2.position = soundButton.position
        soundButton.zPosition = 15
        soundButton2.zPosition = 15
        self.addChild(soundButton)
        
        //soundButton2.position = soundButton.position
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.locationInNode(self){
            
            let node = nodeAtPoint(location)
            
            if node.name == "button1" {
                
                node.removeFromParent()
                
                //Not really needed for this example, but a good habit
                if soundButton2.parent == nil {
                    
                    addChild(soundButton2)
                }
                
            }else if node.name == "button2"{
                
                node.removeFromParent()
                
                //Not really needed for this example, but a good habit
                if soundButton.parent == nil {
                    
                    addChild(soundButton)
                }
            }
        }
        
        
        
        
        
        
        
        
}

//    The other way way would be to subclass a SKSpriteNode and make your Button class (Button:SKSpriteNode), set its userInteractionEnabled property to true, and implement its touchesBegan/touchesEnded methods.
//
//    Or you can use SKAButton class which has a lot of different functionalities (mimics the usefulness of UIButton).


}




