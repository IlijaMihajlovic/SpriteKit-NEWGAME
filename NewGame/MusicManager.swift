//
//  MusicManager.swift
//  NewGame
//
//  Created by Ilija Mihajlovic on 9/4/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import Foundation
import AVFoundation

class MusicManager {
    
    static let shared = MusicManager()
    var audioPlayer = AVAudioPlayer()
    
    //private singleton init
    private init() {}

    func setup() {
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "summer", ofType: "mp3")!))
        } catch {
            print(error)
        }
    }
    
    func play() {
        audioPlayer.play()
    }
    
   
    
    func stop() {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        audioPlayer.prepareToPlay()
    }
    
}


//When the project launches just call the setup method
//
//MusicManager.shared.setup()
//
//Than from any where in the project we can use
//
//MusicManager.shared.play()
//
//to play the music.
//
//To than stop it just call the stop method

