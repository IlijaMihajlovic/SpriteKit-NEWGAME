//
//  GameViewController.swift
//  NewGame
//
//  Created by Ilija Mihajlovic on 9/1/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import SpriteKit
import AVFoundation

class GameViewController: UIViewController {
    

    let skView: SKView = {
        let view = SKView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(skView)
        
        
        skView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        skView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        skView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        skView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        let scene = SettingsScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.heigth))
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        SKTAudio.sharedInstance().playBackgroundMusic("summer.mp3")
        

    }
}
