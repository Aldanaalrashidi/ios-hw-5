//
//  PlayerDetailsVC.swift
//  MarioParty
//
//  Created by tahani alrashidi on 7/1/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerDetailsVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var starsImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var playerSoundEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedPlayer.name
        //imageView.image = UIImage(named: selectedPlayer.name)
        imageView.loadGif(name: selectedPlayer.name)
        backgroundImageView.image = UIImage(named: selectedPlayer.bgName())
    }
    
    @IBAction func randomStars(_ sender: Any) {
        let stars = ["Star1", "Star2", "Star3", "Star4", "Star5"]
        let randomStar = stars.randomElement()!
        starsImageView.image = UIImage(named: randomStar)
    }
    
    @IBAction func playCharacterSound(_ sender: Any) {
        playMusic(musicName: selectedPlayer.musicName())
    }
    
    func playMusic(musicName: String){
        let path = Bundle.main.path(forResource: musicName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do{
            
            playerSoundEffect = try AVAudioPlayer(contentsOf: url)
            playerSoundEffect?.play()
        }catch{
            
            // couldn't load file
        }
    }
    
}
