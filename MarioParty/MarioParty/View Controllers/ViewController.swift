//
//  ViewController.swift
//  MarioParty
//
//  Created by Dalal Alhazeem on 3/24/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation

var selectedPlayer = Player(name: "Mario")

class ViewController: UIViewController {

    @IBOutlet weak var playerImageView: UIImageView!
    var playSoundEffect: AVAudioPlayer?
    var backgroundMusic: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundMusic()
        // Do any additional setup after loading the view.
        //nextButton.isUserInteractionEnabled = false
    }
    
    func playBackgroundMusic(){
        let path = Bundle.main.path(forResource: "BG.wav", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do{
            backgroundMusic = try AVAudioPlayer(contentsOf: url)
            backgroundMusic?.play()
        }catch{
            // couldn't load file
        }
    }
    
    
    func playMusic(musicName: String){
        let path = Bundle.main.path(forResource: musicName, ofType: nil)!
               let url = URL(fileURLWithPath: path)
               
               do{
                   playSoundEffect = try AVAudioPlayer(contentsOf: url)
                   playSoundEffect?.play()
               }catch{
                   // couldn't load file
               }
    }

    @IBAction func randomPlayer(_ sender: Any) {
        let randomPlayer = players.randomElement()!
        playerImageView.image = UIImage(named: randomPlayer.name)
        playMusic(musicName: randomPlayer.musicName())
        selectedPlayer = randomPlayer
    }
    
}

