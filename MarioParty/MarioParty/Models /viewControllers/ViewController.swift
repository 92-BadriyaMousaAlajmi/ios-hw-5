//
//  ViewController.swift
//  MarioParty
//
//  Created by Dalal Alhazeem on 3/24/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation
var selectedPlayer = Player(name: "Waluigi")

class ViewController: UIViewController {
    
    @IBOutlet weak var playerViewImage: UIImageView!
    var playersSoundEffect : AVAudioPlayer?
    var backgroundMusic : AVAudioPlayer?
    
    override func viewDidLoad() {
    super.viewDidLoad()
        playBackgroundMusic(musicName: "BG.wav")
    }
    func playBackgroundMusic(musicName: String){
              let path = Bundle.main.path(forResource: musicName, ofType:nil)!
              let url = URL(fileURLWithPath: path)
              
              do {
                  backgroundMusic = try AVAudioPlayer(contentsOf: url)
                  backgroundMusic?.play()
              } catch {
                  // couldn't load file :(
              }
      }
    func playMusic(musicName: String){
            let path = Bundle.main.path(forResource: musicName, ofType:nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                playersSoundEffect = try AVAudioPlayer(contentsOf: url)
                playersSoundEffect?.play()
            } catch {
                // couldn't load file :(
            }
    }

    @IBAction func randomPlayer(_ sender: UIButton) {

        let randomPlayer = players.randomElement()!
        playerViewImage.loadGif(name: randomPlayer.name)
        playMusic(musicName: randomPlayer.musicName())
        selectedPlayer = randomPlayer
        
    }
}
