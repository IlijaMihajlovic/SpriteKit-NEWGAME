//
//  MyAppPlayerStats.swift
//  SpriteKit Programmatically
//
//  Created by Ilija Mihajlovic on 8/27/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import Foundation
import SpriteKit

let kSoundsState = "kSoundsState"
let kBackgroundMusicName = "summer"
let kBackgroundMusicExtension = "mp3"
let kScore = "kScore"
let kBestScore = "kBestScore"
let kMusicvolume = "kMusicVolume"

enum SoundFileName: String {
    case ClickSound = "ClickSound.mp3"
}

class MyAppPlayerStats {
    
    private init() {}
    //Creating a singleton
    static let shared = MyAppPlayerStats()
    
    func setScore(_ value: Int) {
        
        //Set up new best score
        
        if value > getBestScore() {
            setBestScore(value)
        }
        
        UserDefaults.standard.set(value, forKey: kScore)
        UserDefaults.standard.synchronize()
    }
    func getScore() -> Int {
        return UserDefaults.standard.integer(forKey: kScore)
    }
    
    func setBestScore(_ value: Int) {
        UserDefaults.standard.set(value, forKey: kBestScore)
    }
    
    func getBestScore() -> Int {
      return UserDefaults.standard.integer(forKey: kBestScore)
    }
    
    func setSounds(_ state: Bool) {
        UserDefaults.standard.set(state, forKey: kSoundsState)
        UserDefaults.standard.synchronize()
    }
    
    //Checking if the sound is enabled or not 
    func getSound() -> Bool {
        return UserDefaults.standard.bool(forKey: kSoundsState)
    }
    
    func saveMusicVolume(_ value: Float) {
        UserDefaults.standard.set(value, forKey: kMusicvolume)
        UserDefaults.standard.synchronize()
    }
    
    func getMusicVolume() -> Float {
        return UserDefaults.standard.float(forKey: kMusicvolume)
    }
    
}









