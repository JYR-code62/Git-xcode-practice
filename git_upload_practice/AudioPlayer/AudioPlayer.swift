//
//  AudioPlayer.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 06/09/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit
import AVFoundation

class AudioPlayer: UIViewController {
    
    @IBOutlet var button: UIButton!
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    @IBAction func handlePlayPause(_ sender: UIButton) {
        if let player = player, player.isPlaying{
            //stop playback
            button.setTitle("Play", for: .normal)
            player.stop()
        }
        else{
            
            //set up player and play
            
            button.setTitle("Stop", for: .normal)
            
            
            
            let urlstring = Bundle.main.path(forResource: "Mount Olympus - Approaching Nirvana", ofType: ".mp3")
            
            do{
                guard let urlstring = urlstring else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlstring))
                
                guard  let player = player else {
                    return
                }
                
                player.play()
            }
            catch{
                print("Error occured")
            }
        }
        
        
        
        
        
        
    }
 
    

}
