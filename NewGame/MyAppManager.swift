//
//  MyAppManager.swift
//  SpriteKit Programmatically
//
//  Created by Ilija Mihajlovic on 8/23/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import Foundation
import SpriteKit

let AppId = "1234"

class MyAppManager {
    
    enum SceneType {
        case MainMenu
        case GameplayScene
        case GameOver
        case SettingsScene
        
    }
    
    //initialize of class private
    private init() {}
    
    //Creating a singleton instance of our class
    //any time we write MyAppManager.shared we will get access to this class public methods
   
    static let shared = MyAppManager()
    
    public func launch() {
        firstLaunch()
    }
    
    //Run this method only on the first launch of the app
    private func firstLaunch() {
        if !UserDefaults.standard.bool(forKey: "isFirstLaunch") {
            
            print("This is our first launch")
           
            MyAppPlayerStats.shared.setSounds(true)
            
            //Set the music volime to 40%
            MyAppPlayerStats.shared.saveMusicVolume(0.4)
            
            UserDefaults.standard.set(true, forKey: "isFirstLaunch")
            UserDefaults.standard.synchronize()
        }
    }
    
    func transiton(_ fromScene: SKScene, toScene: SceneType, transition: SKTransition? = nil) {
        guard let scene = getScene(toScene) else { return }
        
        
        
        if let transition = transition {
            scene.scaleMode = .resizeFill
            fromScene.view?.presentScene(scene, transition: transition)
        } else {
            scene.scaleMode = .resizeFill
            fromScene.view?.presentScene(scene)
        }
    }
    
    func getScene(_ sceneType: SceneType) -> SKScene? {
        switch  sceneType {
        case SceneType.MainMenu:
            return MainMenu(size: CGSize(width: ScreenSize.width, height: ScreenSize.heigth))
        
        case SceneType.GameplayScene:
            return GameplayScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.heigth))
            
        case SceneType.GameOver:
            return GameOver(size: CGSize(width: ScreenSize.width, height: ScreenSize.heigth))
            
        case SceneType.SettingsScene:
            return SettingsScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.heigth))
        }
    }
    
    //The sound will be only played when the function getSound() returns true
    func run(_ fileName: String, onNode: SKNode) {
        
        //**Enabele/ Disable clik sound**
       
        //if MyAppPlayerStats.shared.getSound() {
        onNode.run(SKAction.playSoundFileNamed(fileName, waitForCompletion: false))
        //}
    }
    
    //Create an UIAlertController
    func showAlert(on scene: SKScene,title: String, message: String?, preferredStyle: UIAlertControllerStyle = .alert, actions: [UIAlertAction], animated: Bool = true, deley: Double = 0.0, completion: (() -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        for action in actions {
            alert.addAction(action)
        }
        let wait = DispatchTime.now() + deley
        
        DispatchQueue.main.asyncAfter(deadline: wait) {
            scene.view?.window?.rootViewController?.present(alert, animated: animated, completion: completion)
        }
    }
    
    //Create UIActivityController
    func share(on scene: SKScene, text: String, image: UIImage?, excludeActivityTypes: [UIActivityType]) {
        
        guard let image = UIImage(named: "shareButton") else {return}
        
        //Set up ActivityViewController
        let shereItems = [text, image] as [Any]
        
        let activityViewController = UIActivityViewController(activityItems: shereItems, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = scene.view /* So the iPads wont crash. For iPhone development it's not necassary */
        
        //Exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = excludeActivityTypes
        
        //present the view cotroller
        scene.view?.window?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
    
    
    
}








