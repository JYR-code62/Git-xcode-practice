//
//  VideoPlayer.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 01/09/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayer: UIViewController {
    

    @IBAction func btnClicked(_ sender: Any) {
        
        //let url = "https://www.youtube.com/embed/IQ1JiveuhvM"
        
        let url = "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.mp4"
        
        let player = AVPlayer(url: URL(string: url)!)
        
        let vc = AVPlayerViewController()
        vc.player = player
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true, completion:
            {
                player.play()
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   

}

//https://www.youtube.com/watch?v=4P_ZsOqELBo
