//
//  MeinMenu.swift
//  NewGame
//
//  Created by Ilija Mihajlovic on 9/1/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    
    lazy var playButton: BDButton = {
        var button = BDButton(imageNamed: "settingsButton", buttonAction: {
            
        })
        button.zPosition = 1
        return button
    }()
    
    override func didMove(to view: SKView) {
        setupNodes()
        addNodes()
    }
    
    
    func setupNodes() {
        
    }
    
    func addNodes() {
        
    }
    
 
}
